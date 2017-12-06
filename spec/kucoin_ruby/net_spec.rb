require 'spec_helper'

describe KucoinRuby::Net do
  describe "key" do
    context 'with ENV' do
      before { ENV['KUCOIN_KEY'] = 'key' }
      after { ENV.delete('KUCOIN_KEY') }

      subject {KucoinRuby::Net.key}
      it { expect(subject).to eq('key') }
    end
    context 'without ENV' do
      subject {KucoinRuby::Net.key}
      it { expect(subject).to eq('fake_key') }
    end
  end

  describe "secret" do
    context 'with ENV' do
      before { ENV['KUCOIN_SECRET'] = 'secret' }
      after { ENV.delete('KUCOIN_SECRET') }

      subject {KucoinRuby::Net.secret}
      it { expect(subject).to eq('secret') }
    end
    context 'without ENV' do
      subject {KucoinRuby::Net.secret}
      it { expect(subject).to eq('fake_secret') }
    end
  end

  describe 'headers' do
    let(:nonce) { '1231231231231'}
    let(:signature) { 'aaaaaa' }
    subject { KucoinRuby::Net.headers(nonce, signature) }
    it { expect(subject['Content-Type']).to eq('application/json') }
    it { expect(subject['KC-API-KEY']).to eq('fake_key') }
    it { expect(subject['KC-API-NONCE']).to eq(nonce) }
    it { expect(subject['KC-API-SIGNATURE']).to eq(signature) }
    it { expect(subject['Accept-Language']).to eq('en_EN') }
  end
end
