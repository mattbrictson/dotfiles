#!/usr/bin/env -S-P${HOME}/.rbenv/shims:${PATH} ruby

require "./lib/xbar_http"

def data
  @data ||= XbarHttp.post(
    "https://airnowgovapi.com/reportingarea/get",
    latitude: "37.78907000000004",
    longitude: "-122.39492999999999",
    stateCode: "CA",
    maxDistance: 5
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

def xbar
  "AQI #{aqi}| size=11 #{color}"
end

puts xbar
