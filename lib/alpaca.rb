require "alpaca/version"
require 'alpaca/configuration'

module Alpaca
  class Error < StandardError; end

  class << self
    # Customize default settings for the SDK using block.
    #   Alpaca.configure do |config|
    #     config.api_key_id = "xxx"
    #     config.api_secret = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
