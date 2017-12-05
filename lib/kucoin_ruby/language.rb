module KucoinRuby
  module Language
    def self.lang_list
      KucoinRuby::Net.get('/v1/open/lang-list')
    end

    def self.change_lang(lang)
      endpoint = '/v1/user/change-lang'
      payload = {lang: lang}
      KucoinRuby::Net.signed_post(endpoint, payload)
    end
  end
end
