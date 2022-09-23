module Alpaca
  module Data
    class Historical
      def initialize(symbol:, options:)
        @symbol = symbol
        @options = options
      end

      private

      attr_reader :symbol, :options, :api_client

      VALID_OPTIONS = %i[start end limit asof feed page_token currency].freeze

      def _symbol
        serialize_string(symbol).upcase
      end

      def serialized_params
        serialized_options
      end

      def serialized_options
        options.select { |k| VALID_OPTIONS.include? k }
      end

      def format_time(time)
        Time.at(time).utc.iso8601
      end

      def serialize_string(str)
        str.to_s.gsub(/\W|\d/i, '')
      end
    end
  end
end