require 'oystercard'

describe Oystercard do
  it { is_expected.to have_attributes(:balance => 0) }

  it { should respond_to(:top_up).with(1).argument  }
  it 'tops up oystercard' do
    oystercard = Oystercard.new
    oystercard.top_up(2)
    expect(oystercard.balance).to eq(2)
  end

  it "Raises an error when card is full" do
    max_balance = Oystercard::MAX_BALANCE
    oystercard = Oystercard.new
    oystercard.top_up(max_balance)
    expect { oystercard.top_up 1 }.to raise_error("Card has reached its £#{max_balance} limit!")
  end

  it "Deducts the fare from the balance" do
    fare = Oystercard::FARE
    oystercard = Oystercard.new
    oystercard.top_up(10)
    expect(oystercard.deduct).to eq(10 - fare)
  end

  it "Should confirm passenger is in journey" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in
    expect(oystercard.status).to be true
  end

  it "Should touch in at journey beginning" do
    fare = Oystercard::FARE
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in
    expect(oystercard.status).to be true
    expect(oystercard.balance).to eq(10 - fare)
  end

  it "Should touch out at journey end" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard.status).to be false
  end

  it 'should prevent travelling with balance less than £1' do
    fare = Oystercard::FARE
    balance = Oystercard::BALANCE
    oystercard = Oystercard.new
    expect { oystercard.touch_in }.to raise_error("Not enough money on card! Your balance is £#{balance}")
  end

end
