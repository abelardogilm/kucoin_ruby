module KucoinRuby
  module Currency
    def self.exanges
      KucoinRuby::Net.get('/v1/open/currencies')
    end
  end
end
