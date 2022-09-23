module Alpaca
  module Data
    class Quote < Historical
      def endpoint
        "#{_symbol}/quotes"
      end

      def method
        'get'
      end

      def params
        query_params
      end

      private

      def query_params
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
    end
  end
end
