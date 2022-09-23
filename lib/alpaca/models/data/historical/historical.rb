module Alpaca
  module Data
    class Historical
      def initialize(symbol:, options:)
        @symbol = symbol
        @options = options
      end

      def method
        'get'
      end

      def params
        _params
      end

      private

      attr_reader :symbol, :options, :api_client

      VALID_OPTIONS = %i[start end limit asof feed page_token currency].freeze

      def _symbol
        serialize_string(symbol).upcase
      end

      def _params
        serialized_options.each_with_object({}) do |(key, value), query|
          case key.to_s
          when 'start' then query[key] = format_time(value)
          when 'end' then query[key] = format_time(value)
          when 'limit' then query[key] = value.to_i
          when 'asof' then query[key] = value
          when 'feed' then query[key] = serialize_string(value).downcase
          when 'page_token' then query[key] = value
          when 'currency' then query[key] = serialize_string(value).upcase
          end
        end
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