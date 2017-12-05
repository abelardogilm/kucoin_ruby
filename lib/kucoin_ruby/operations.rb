module KucoinRuby
  module Operations
    def self.get_coin_address(coin)
      endpoint = "/v1/account/#{coin}/wallet/address"
      KucoinRuby::Net.signed_get(endpoint)
    end

    def self.create_withdrawal(coin, amount, address)
      endpoint = "/v1/account/#{coin}/withdraw/apply"
      payload = {coin: coin, amount: amount, address: address}
      KucoinRuby::Net.signed_post(endpoint, payload)
    end

    def self.cancel_withdrawal(coin, txOid)
      endpoint = "/v1/account/#{coin}/withdraw/apply"
      payload = {coin: coin, txOid: txOid}
      KucoinRuby::Net.signed_post(endpoint, payload)
    end

    def self.wallet_records(coin, type, status, limit=nil, page=nil)
      #TODO
      endpoint = "/v1/account/#{coin}/wallet/records"
      query_string = {limit: limit, page: page, status: status, type: type}
      KucoinRuby::Net.signed_get(endpoint, query_string)
    end

    def self.coin_balance(coin)
      KucoinRuby::Net.signed_get("/v1/account/#{coin}/balance")
    end

    def self.balance
      KucoinRuby::Net.signed_get("/v1/account/balance")
    end
  end
end
