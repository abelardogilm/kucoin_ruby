module KucoinRuby
  module User
    def self.user_info
      KucoinRuby::Net.signed_get('/v1/user/info')
    end
  end
end
