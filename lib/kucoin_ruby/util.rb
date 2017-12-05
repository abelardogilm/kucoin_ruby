module KucoinRuby
  class Util
    def self.nonce
      (Time.now.to_f * 1000).to_i.to_s
    end

    def self.build_message(endpoint, nonce, queryString = '')
      "#{endpoint}/#{nonce}/#{queryString.to_param}"
    end

    def self.sign(string)
      base = Base64.strict_encode64(string)
      sign_hmac(base)
    end

    def self.sign_message(endpoint, queryString = '')
      nc = nonce
      [nc, sign(build_message(endpoint, nc, queryString.to_param))]
    end

    private

    def self.sign_hmac(string)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), KucoinRuby::NetConfig.secret, string)
    end
  end
end
