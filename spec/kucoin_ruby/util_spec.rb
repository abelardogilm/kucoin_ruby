require 'spec_helper'

describe KucoinRuby::Util do
  describe "nonce" do
    subject {KucoinRuby::Util.nonce}
    it 'has to be 13 digits' do
      expect(subject.size).to eq(13)
    end
  end

  describe "build_message" do
    let(:endpoint) { '/v1/endpoint' }
    let(:nonce) { '1231231231231' }
    let(:query_string) { 'a=1' }
    it {
      expect(KucoinRuby::Util.build_message(endpoint, nonce, query_string))
        .to eq('/v1/endpoint/1231231231231/a=1')
    }
    it {
      expect(KucoinRuby::Util.build_message(endpoint, nonce, nil))
        .to eq('/v1/endpoint/1231231231231/')
    }
    it {
      expect(KucoinRuby::Util.build_message(endpoint, nil, query_string))
        .to eq('/v1/endpoint//a=1')
    }
  end

  describe "sign_hmac" do
    before {
      allow(KucoinRuby::Net).to receive(:secret).and_return('fake_secret')
      @expected = 'd52f2303d3d4d8b170a3294fc7bbba47cf31214632c91f2a22b29ee2e0607a1e'
    }
    subject { KucoinRuby::Util.send(:sign_hmac,'aaa') }
    it { expect(subject).to eq(@expected) }
  end

  describe 'compose_query_string' do
    it 'returns input param if it is not a Hash' do
      expect(KucoinRuby::Util.send(:compose_query_string, nil)).to be_nil
      expect(KucoinRuby::Util.send(:compose_query_string, true)).to be_truthy
      expect(KucoinRuby::Util.send(:compose_query_string, 1)).to eq(1)
      expect(KucoinRuby::Util.send(:compose_query_string, [])).to eq([])
      expect(KucoinRuby::Util.send(:compose_query_string, "a=1&b=2")).to eq("a=1&b=2")
    end
    it 'returns query_param if input is a hash' do
      expect(KucoinRuby::Util.send(:compose_query_string, {a:1, b: 2})).to eq("a=1&b=2")
      expect(KucoinRuby::Util.send(:compose_query_string, {})).to eq("")
    end
  end

  describe 'sign_message' do
    let(:endpoint) { '/v1/endpoint' }
    let(:nonce) { '1231231231231' }
    before {
      allow(KucoinRuby::Util).to receive(:nonce).and_return(nonce)
    }
    context 'with query_params' do
      before {
        @expected = [ nonce, "1472931c087bf678abe28d19771d918b7ea5ca24f24827481351d57007a230c9" ]
      }
      subject { KucoinRuby::Util.sign_message(endpoint, "a=1") }
      it { expect(subject).to eq(@expected) }
    end

    context 'without query_params' do
      before {
        @expected = [ nonce, "3594157348d3264784b60c695dde6461e167eb542854cc8c1139301d756554b1" ]
      }
      subject { KucoinRuby::Util.sign_message(endpoint) }
      it { expect(subject).to eq(@expected) }
    end
  end

  describe 'sign' do
    let(:input) { 'string_to_sign' }
    before {
      allow(KucoinRuby::Net).to receive(:secret).and_return('fake_secret')
      @expected = '55077c84c3df75060dcc06c9d6a76bb196ce61ed09c48a7aee514774e4b98cc2'
    }
    subject { KucoinRuby::Util.sign(input) }
    it { expect(subject).to eq(@expected) }
  end

end
