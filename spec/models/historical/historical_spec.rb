require 'spec_helper'

RSpec.describe Alpaca::Historical do
  let(:symbol) { '' }
  let(:options) { nil }
  let(:instance) { described_class.new(symbol: symbol, options: options) }

  describe '.method' do
    subject { instance.method }

    it { is_expected.to eq('get') }
  end

  describe '.params' do
    subject(:params_call) { instance.params }

    describe 'invalid options are filtered out' do
      let(:options) { { foo: 'test' } }

      it { is_expected.to eq({}) }
    end

    describe 'valid params' do
      let(:start) { Time.new(2022,8,16,15,25,0) }
      let(:end_time) { Time.new(2022, 8, 17, 15, 25, 0)  }
      let(:options) do
        {
          start: start,
          stop: end_time,
          limit: '1',
          asof: 'asof',
          feed: 'FEED123!',
          page_token: 'page_token',
          currency: 'gbp'
        }
      end

      it 'are formatted correctly' do
        expect(params_call.values).to eq(
          ['2022-08-16T14:25:00Z', 1, 'asof', 'feed', 'page_token', 'GBP']
          )
      end
    end
  end
end