module Alpaca
  class MarketData
    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    def quote(symbol:, options: {})
      request = Quote.new(symbol: symbol, options: options)
      call_api(request)
    end

    private

    def call_api(request)
      api_client.execute(request)
    end

    attr_accessor :api_client
  end
end