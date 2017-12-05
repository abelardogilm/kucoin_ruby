module KucoinRuby
  module Inviting
    def self.invitation_count
      KucoinRuby::Net.signed_get('/v1/referrer/descendant/count')
    end

    def self.promotion_reward
      KucoinRuby::Net.signed_get('/v1/account/promotion/info')
    end

    def self.promotion_summary
      KucoinRuby::Net.signed_get('/v1/account/promotion/sum')
    end
  end
end
