module Alpaca
  class Configuration
    class ConfigurationError < StandardError; end
    # Defines url scheme
    attr_accessor :scheme

    # Defines url host
    attr_accessor :host

    # Defines url base path
    attr_accessor :base_path

    # Defines account api id and secret
    attr_accessor :api_key_id

    attr_accessor :api_secret

    # Define paper trading
    attr_accessor :enable_testing

    def initialize
      @scheme = 'https'
      @enable_testing = false
      @host = enable_testing ? 'paper-api.alpaca.markets' : 'data.alpaca.markets'
      @base_path = '/v2/stocks/'
      @api_key_id = ''
      @api_secret = ''

      yield(self) if block_given?
    end

    # The default Configuration object.
    def self.default
      @@default ||= Configuration.new
    end

    def configure
      yield(self) if block_given?
    end
  end
end