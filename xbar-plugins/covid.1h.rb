#!/usr/bin/env -S-P${HOME}/.rbenv/shims:${PATH} ruby

require "./lib/xbar_http"
require "date"
require "active_support"
require "active_support/number_helper"

def settings
  @settings ||= begin
    path = File.expand_path(".config/xbar/settings.json", Dir.home)
    JSON.parse(File.read(path))
  end
end

def data
  @data ||= XbarHttp.get(
    "https://api.covidactnow.org/v2/county/#{settings.dig('covid', 'county_fips')}.timeseries.json",
    apiKey: settings.dig("covid", "api_key")
  )
end

Metric = Struct.new(:label, :value, :risk, :date, :formatter, :previous_values, keyword_init: true) do
  def present?
    !value.nil?
  end

  def to_s
    formatter.call(value)
  end
end

HistoricalValue = Struct.new(:value, :date, :formatter, keyword_init: true) do
  def to_s
    formatter.call(value)
  end
end

def build_metric(formatter:, label:, value_key:, risk_key:, drop: nil) # rubocop:disable Metrics/MethodLength
  timeseries = data["metricsTimeseries"].reverse_each.lazy.reject { |entry| entry.fetch(value_key).nil? }
  timeseries = timeseries.drop(drop) if drop
  empty = timeseries.first.nil?

  metric = Metric.new(
    value: empty ? nil : timeseries.first[value_key],
    date: empty ? Date.today : Date.parse(timeseries.first["date"]),
    risk: empty ? nil : data.dig("riskLevels", risk_key),
    previous_values: [],
    label:,
    formatter:
  )
  timeseries.drop(1).take(3).each do |entry|
    metric.previous_values << HistoricalValue.new(
      value: entry[value_key],
      date: Date.parse(entry["date"]),
      formatter:
    )
  end
  metric
end

def format_decimal(value)
  case value&.abs
  when nil then "N/A"
  when 0...1.5 then format("%0.2f", value)
  when 1.5...100 then format("%0.1f", value)
  else ActiveSupport::NumberHelper.number_to_delimited(value.to_i)
  end
end

def case_density
  metric = build_metric(
    formatter: -> { format_decimal(_1) },
    label: "Weekly New Cases / 100K",
    value_key: "weeklyNewCasesPer100k",
    risk_key: "caseDensity"
  )
  metric.risk = [0, metric.risk - 1].max
  metric
end

def find_peak(formatter:, value_key:)
  nine_months_ago = (Date.today << 9).to_s
  peak = data["metricsTimeseries"]
    .reverse_each
    .lazy
    .reject { |entry| entry[value_key].nil? }
    .drop_while { |entry| entry["infectionRate"].to_f > 1 }
    .take_while { |entry| entry["date"] >= nine_months_ago }
    .max_by { |entry| entry[value_key] }

  return nil if peak.nil?

  HistoricalValue.new(
    value: peak[value_key],
    date: Date.parse(peak["date"]),
    formatter:
  )
end

def case_density_recent_peak
  find_peak(formatter: -> { format_decimal(_1) }, value_key: "weeklyNewCasesPer100k")
end

def case_density_doubling_days
  return if infection_rate.value < 1.1

  half_current_density = case_density.value / 2
  half_date = data["metricsTimeseries"]
    .reverse_each
    .lazy
    .reject { |entry| entry["weeklyNewCasesPer100k"].nil? }
    .drop_while { |entry| entry["weeklyNewCasesPer100k"] > half_current_density }
    .first["date"]

  (case_density.date - Date.parse(half_date)).to_i
end

def test_positivity_ratio
  build_metric(
    formatter: -> { "#{format_decimal(_1 && (_1 * 100))}%" },
    label: "Test Positivity Ratio",
    value_key: "testPositivityRatio",
    risk_key: "testPositivityRatio"
  )
end

def test_positivity_ratio_recent_peak
  find_peak(formatter: -> { "#{format_decimal(_1 && (_1 * 100))}%" }, value_key: "testPositivityRatio")
end

def infection_rate
  metric = build_metric(
    formatter: -> { format_decimal(_1) },
    label: "Infection Rate",
    value_key: "infectionRate",
    risk_key: "infectionRate",
    drop: 7
  )
  # CAN classifies zero risk as below 0.9; slightly shift this upward to 1.0
  metric.risk = 0 if metric.value && metric.value < 1
  metric
end

def worst_metric
  [case_density, test_positivity_ratio, infection_rate].select(&:risk).max_by(&:risk)
end

def risk_color(metric)
  return "❔" if metric.risk.nil?

  ["🟢", "🟡", "🟠"][metric.risk] || "🔴"
end

def infection_rate_arrow
  case infection_rate.value
  when (...0.85) then "↓↓"
  when (0.85...0.97) then "↓"
  when (1.03...1.25) then "↑"
  when (1.25..) then "↑↑"
  end
end

def date_in_words(metric)
  days_ago = (Date.today - metric.date).to_i
  case days_ago
  when 0 then "today"
  when 1 then "yesterday"
  when 2..6 then "#{days_ago} days ago"
  when 7 then "1 week ago"
  else metric.date.strftime("%b %e")
  end
end

def format_approximate_date(date)
  if Date.today - date < 30
    "on #{date.strftime('%b %e')}"
  elsif Date.today.month < date.month && Date.today - date < 120
    "last #{date.strftime('%B')}"
  elsif Date.today.year != date.year
    "in #{date.strftime('%B %Y')}"
  else
    "in #{date.strftime('%B')}"
  end
end

def render_metric(metric)
  history = metric.previous_values.map do |data_point|
    "#{data_point} on #{data_point.date.strftime('%B %d')}| href=#{data['url']}"
  end

  <<~METRIC.strip
    #{risk_color(metric)} #{metric.label}| size=11
    #{metric} as of #{date_in_words(metric)}| href=#{data['url']}
    #{history.join("\n")}
  METRIC
end

def render_summary
  days_ago = (Date.today - worst_metric.date).to_i
  old = days_ago > 6 || (Date.today - Date.parse(data["lastUpdatedDate"])) > 1

  cdc_says_mask_up = data.dig("communityLevels", "cdcCommunityLevel") > 1

  text = cdc_says_mask_up ? "😷 " : "#{risk_color(worst_metric)} "
  text << [infection_rate_arrow, case_density].compact.join(" ")
  text << " (#{test_positivity_ratio})" if test_positivity_ratio.present?
  text << " -#{days_ago}d" if old
  text << "| size=11"
  text
end

def render_case_density_change
  days = case_density_doubling_days
  return nil if days.nil? || days > 31

  duration = case days
             when 6..8 then "every week"
             when 13..17 then "every 2 weeks"
             when 18..25 then "every 3 weeks"
             when 26..31 then "every 4 weeks"
             else "every #{days} days"
             end

  "#{infection_rate_arrow} New cases doubling #{duration}|size=11 href=#{data['url']}".squish
end

def render_peak(peak)
  return nil if peak.nil?

  "Previous high was #{peak} #{format_approximate_date(peak.date)}|size=11 href=#{data['url']}"
end

def xbar
  [
    render_summary,
    "---",
    render_metric(case_density),
    render_case_density_change,
    render_peak(case_density_recent_peak),
    "---",
    render_metric(test_positivity_ratio),
    render_peak(test_positivity_ratio_recent_peak),
    "---",
    render_metric(infection_rate)
  ].compact.join("\n")
end

puts xbar
