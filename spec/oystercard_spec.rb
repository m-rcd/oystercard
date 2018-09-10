require 'oystercard'

describe Oystercard do
  it { is_expected.to have_attributes(:balance => 0) }

  it 'tops up oystercard' do
    oystercard = Oystercard.new
    oystercard.top_up(6)
    expect(oystercard.balance).to eq(6)
  end
end
