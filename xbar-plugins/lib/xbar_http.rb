require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "activesupport"
  gem "faraday"
  gem "faulty"
end

require "active_support"
require "active_support/cache"
require "date"
require "digest"
require "fileutils"
require "json"

Faulty.init do |config|
  cache_path = File.expand_path(".cache/xbar/faulty.cache", Dir.home)
  FileUtils.mkdir_p(File.dirname(cache_path))

  config.cache = Faulty::Cache::Rails.new(ActiveSupport::Cache::FileStore.new(cache_path))
  config.circuit_defaults = {
    cache_refreshes_after: 5
  }
end

module XbarHttp
  class << self
    def get(url, **params)
      request(:get, url, params)
    end

    def post(url, **params)
      request(:post, url, params)
    end

    private

    def request(method, url, params)
      cache_key = Digest::SHA256.hexdigest([method, url, params].inspect)
      body = Faulty.circuit(URI(url).host).run(cache: cache_key) do
        http.public_send(method, url, **params).body
      end
      JSON.parse(body)
    end

    def http
      @http = Faraday.new do |builder|
        builder.request :url_encoded
        builder.response :raise_error
        builder.adapter :net_http
      end
    end
  end
end
