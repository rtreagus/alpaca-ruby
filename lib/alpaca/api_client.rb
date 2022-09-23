require 'faraday'

module Alpaca
  class ApiClient
    class ResponseError < StandardError; end

    def initialize
      @config = Configuration.default
    end

    def self.default
      @@default ||= new
    end

    def execute(request)
      response = http_call(request)

      case response.status
      when 200 then response.body
      when 404 then []
      else raise ResponseError, response.body
      end
    end

    private

    attr_reader :config

    def base_url
      config.scheme + [config.host, config.api_version, config.base_path].join('/')
    end

    def http_call(request)
      params = request.params
      endpoint = request.endpoint
      request.method.eql?('get') ? connection.get(endpoint, params, headers) : connection.post(endpoint, params, headers)
    end

    def headers
      {
        'Apca-Api-Key-Id': config.api_key_id,
        'Apca-Api-Secret-Key': config.api_secret
      }
    end

    def connection
      Faraday.new(base_url, request: { open_timeout: 5, timeout: 5 }) do |f|
        f.request :json
        f.response :json
      end
    end
  end
end