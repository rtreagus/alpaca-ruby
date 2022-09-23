require 'spec_helper'

RSpec.describe Alpaca::Quote do
  let(:instance) { described_class.new(symbol: 'symbol', options: {}) }

  it 'belongs to Historical' do
    expect(described_class.ancestors).to include(Alpaca::Historical)
  end

  describe '.endpoint' do
    subject { instance.endpoint }

    it { is_expected.to eq('SYMBOL/quotes') }
  end
end