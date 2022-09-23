module Alpaca
  class Quote < Historical
    def endpoint
      "#{_symbol}/quotes"
    end
  end
end
