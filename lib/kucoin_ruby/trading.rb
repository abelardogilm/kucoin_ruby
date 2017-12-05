module KucoinRuby
  module Trading
    def create_order(symbol, type, price, amount)
      endpoint = '/v1/order'
      payload = {symbol: symbol, type: type, price: price, amount: amount}
      KucoinRuby::Net.signed_post(endpoint, payload)
    end

    def active_orders(symbol = nil)
      endpoint = '/v1/order/active'
      query_string = {symbol: symbol}
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end

    def cancel_order(symbol, order_id, type)
      endpoint = '/v1/cancel-order'
      payload = {symbol: symbol, type: type, order_id: order_id}
      KucoinRuby::Net.signed_post(endpoint, payload)
    end

    def dealt_orders(symbol, type, limit, page, since, before)
      endpoint = '/v1/order/dealt'
      query_string = {before: before, limit: limit, page: page, since: since, symbol: symbol, type: type}
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end

    def symbol_dealt_order(symbol, type, limit, page )
      endpoint = '/v1/deal-orders'
      query_string = {limit: limit, page: page, symbol: symbol, type: type}
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end
  end
end
