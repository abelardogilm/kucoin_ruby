module KucoinRuby
  class Util
    def self.nonce
      (Time.now.to_f * 1000).to_i.to_s
    end

    def self.build_message(endpoint, nonce, query_string = '')
      "#{endpoint}/#{nonce}/#{query_string}"
    end

    def self.sign(string)
      base = Base64.strict_encode64(string)
      sign_hmac(base)
    end

    def self.sign_message(endpoint, query_string = nil)
      nc = nonce
      query_string = compose_query_string(query_string)
      [nc, sign(build_message(endpoint, nc, query_string))]
    end

    private

    def self.sign_hmac(string)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), KucoinRuby::Net.secret, string)
    end

    def self.compose_query_string(query_string)
      return query_string unless query_string.is_a? Hash
      uri = Addressable::URI.new
      uri.query_values = query_string
      uri.query
    end
  end
end
