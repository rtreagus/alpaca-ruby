module Alpaca
  module Data
    class Quote < Historical
      def endpoint
        "#{_symbol}/quotes"
      end
    end
  end
end
