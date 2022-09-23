module Alpaca
  class Configuration
    class ConfigurationError < StandardError; end
    # Defines url scheme
    attr_accessor :scheme

    # Defines url host
    attr_accessor :host

    # Defines url base path
    attr_accessor :base_path

    # Defines account api id
    attr_accessor :api_key_id

    # Defines account api id
    attr_accessor :api_secret

    # Enables paper trading when placing orders
    attr_accessor :enable_testing

    # Defines API version
    attr_reader :api_version

    # Defines Client
    attr_reader :client

    def initialize
      @scheme = 'https://'
      @enable_testing = false
      @host = 'data.alpaca.markets'
      @api_version = 'v2'
      @base_path = 'stocks'
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