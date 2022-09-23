require "spec_helper"

RSpec.describe Alpaca::Configuration do
  subject(:config) { Alpaca.configure }

  describe 'default settings' do
    it 'sets the api key to an empty string' do
      expect(config.api_key_id).to be_empty
    end

    it 'sets the api secret to an empty string' do
      expect(config.api_secret).to be_empty
    end

    it 'sets the base path' do
      expect(config.base_path).to eq('stocks')
    end

    it 'sets the host' do
      expect(config.host).to eq('data.alpaca.markets')
    end

    it 'sets testing' do
      expect(config.enable_testing).to be_falsey
    end
  end

  describe 'setting alpaca config' do
    let(:api_id) { 'api_id' }
    let(:api_secret) { 'api_secret' }

    before do
      Alpaca.configure do |config|
        config.api_key_id = api_id
        config.api_secret = api_secret
        config.enable_testing = true
      end
    end

    it 'sets the api key' do
      expect(config.api_key_id).to eq(api_id)
    end

    it 'sets the api secret' do
      expect(config.api_secret).to eq(api_secret)
    end

    it 'testing can be enabled' do
      expect(config.enable_testing).to be_truthy
    end
  end
end
