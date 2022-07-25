#!/usr/bin/env -S-P${HOME}/.rbenv/shims:${PATH} ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "faraday"
end

require "date"
require "fileutils"
require "json"

def http
  @http = Faraday.new(url: "https://airnowgovapi.com") do |builder|
    builder.request :url_encoded
    builder.response :raise_error
    builder.adapter :net_http
  end
end

def http_post_with_fallback(path, **params)
  cache_path = File.expand_path(".cache/xbar/#{path}.cache", Dir.home)
  FileUtils.mkdir_p(File.dirname(cache_path))

  http.post(path, **params).body.tap do |body|
    File.write(cache_path, body)
  end
rescue StandardError
  raise unless File.exist?(cache_path)

  File.read(cache_path)
end

def data
  @data ||= JSON.parse(
    http_post_with_fallback(
      "reportingarea/get",
      latitude: "37.78907000000004",
      longitude: "-122.39492999999999",
      stateCode: "CA",
      maxDistance: 5
    )
  )
end

def aqi
  readings = data.filter_map do |item|
    item["parameter"] == "PM2.5" && item["aqi"]
  end

  readings.sum / readings.length
end

def color
  case aqi
  when 150...200
    "color=#e20200"
  when (200..)
    "color=purple"
  end
end

def stale?
  issue_date_str = data.filter_map { |item| item["issueDate"] }.first
  issue_date = issue_date_str && Date.strptime(issue_date_str, "%m/%d/%y")

  issue_date.nil? || Date.today - issue_date > 1
end

def xbar
  value = stale? ? "??" : aqi
  "AQI #{value}| size=11 #{color}"
end

puts xbar
