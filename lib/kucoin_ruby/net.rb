require "kucoin_ruby/version"

module KucoinRuby
  class Net
    API_HOST   = 'https://api.kucoin.com'

    def self.key
      ENV['KUCOIN_KEY'] || 'fake_key'
    end

    def self.secret
      ENV['KUCOIN_SECRET'] || 'fake_secret'
    end

    def self.headers(nonce, signature)
      {
        'Content-Type': 'application/json',
        'KC-API-KEY': key,
        'KC-API-NONCE': nonce,
        'KC-API-SIGNATURE': signature,
        "Accept-Language": 'en_EN'
      }
    end

    def self.get(endpoint)
      uri = "#{API_HOST}#{endpoint}"
      handle_response(HTTParty.get(uri))
    end

    def self.signed_get(endpoint, query_string = nil)
      nonce, signature = KucoinRuby::Util.sign_message(endpoint, query_string)
      uri = "#{API_HOST}#{endpoint}?#{query_string}"
      response = HTTParty.get(
        uri,
        headers: headers(nonce, signature)
      )
      handle_response(response)
    end

    def self.signed_post(endpoint, payload = nil)
      nonce, signature = KucoinRuby::Util.sign_message(endpoint)
      uri = "#{API_HOST}#{endpoint}"
      response = HTTParty.post(
        uri,
        headers: headers(nonce, signature),
        body: payload
      )
      handle_response(response)
    end

    def self.handle_response(response)
      if response.code != 200
        raise KucoinRuby::Exceptions::ResponseError.new(response)
      end
      JSON.parse(response.body)
    end
  end
end
