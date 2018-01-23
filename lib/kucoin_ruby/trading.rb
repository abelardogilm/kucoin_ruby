module KucoinRuby
  module Trading
    def self.create_order(symbol, type, price, amount)
      endpoint = "/v1/#{symbol}/order"
      payload = { amount: amount, price: price, type: type }
      KucoinRuby::Net.signed_post(endpoint, payload)
    end

    def self.active_orders(symbol, type = nil)
      endpoint = '/v1/order/active'
      query_string = {symbol: symbol, type: type}
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end

    def self.cancel_order(symbol, order_id, type)
      endpoint = "/v1/#{symbol}/cancel-order"
      payload = {orderOid: order_id, type: type}
      KucoinRuby::Net.signed_post(endpoint, payload)
    end

    def self.dealt_orders(symbol=nil, type=nil, limit=nil, page=nil, since=nil, before=nil)
      endpoint = '/v1/order/dealt'
      query_string = {
        before: before,
        limit: limit,
        page: page,
        since: since,
        symbol: symbol,
        type: type
      }
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end

    def self.symbol_dealt_order(symbol, type=nil, limit=nil, page=nil )
      endpoint = '/v1/deal-orders'
      query_string = {limit: limit, page: page, symbol: symbol, type: type}
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end
  end
end
