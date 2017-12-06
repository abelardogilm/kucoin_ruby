module KucoinRuby
  module Market
    def self.tick(symbol = nil)
      endpoint = "/v1/open/tick"
      endpoint += "?symbol=#{symbol}" if symbol
      KucoinRuby::Net.get(endpoint)
    end

    def self.orders(symbol)
      KucoinRuby::Net.get("/v1/open/orders?symbol=#{symbol}")
    end

    def self.buy_orders(symbol, group, limit)
      endpoint = "/v1/open/orders-buy?symbol=#{symbol}&group=#{group}&limit=#{limit}"
      KucoinRuby::Net.get(endpoint)
    end

    def self.sell_orders(symbol, group, limit)
      endpoint = "/v1/open/orders-sell?symbol=#{symbol}&group=#{group}&limit=#{limit}"
      KucoinRuby::Net.get(endpoint)
    end

    def self.recent_deal_orders(symbol, limit, since)
      endpoint = "/v1/open/deal-orders?symbol=#{symbol}&synce=#{synce}&limit=#{limit}"
      KucoinRuby::Net.get(endpoint)
    end

    def self.trading_symbols
      KucoinRuby::Net.get('/v1/market/open/symbols')
    end

    def self.trending_symbols
      KucoinRuby::Net.get('/v1/market/open/coins-trending')
    end

    def self.kline_data(symbol, type, from, to, limit)
      KucoinRuby::Net.get("/v1/open/kline?symbol=#{symbol}&type=#{type}&from=#{from}&to=#{to}&limit=#{limit}")
    end

    def self.kline_config()
      KucoinRuby::Net.get('/v1/open/chart/config')
    end

    def self.chart_symbol(symbol)
      KucoinRuby::Net.get("/v1/open/chart/symbol?symbol=#{symbol}")
    end

    def self.history_kline_data(symbol, resolution, from, to)
      endpoint = "/v1/open/chart/history?symbol=#{symbol}&resolution=#{resolution}&from=#{from}&to=#{to}"
      KucoinRuby::Net.get(endpoint)
    end

    def self.coin_info(coin)
      KucoinRuby::Net.get("/v1/market/open/coin-info?coin=#{coin}")
    end

    def self.coins
      KucoinRuby::Net.get("/v1/market/open/coins")
    end
  end
end
