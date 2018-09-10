require 'oystercard'

describe Oystercard do

  let (:station){ double :station }

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

  # it "Deducts the fare from the balance" do
  #   fare = Oystercard::FARE
  #   oystercard = Oystercard.new
  #   oystercard.top_up(10)
  #   expect(oystercard.deduct).to eq(10 - fare)
  # end

  xit "Should confirm passenger is in journey" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to be true
  end

  xit "Should touch in at journey beginning" do
    fare = Oystercard::FARE
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to be true
  end

  it "Should touch out at journey end" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    oystercard.touch_out
    expect(oystercard.in_journey?).to be nil
  end

  it 'should prevent travelling with balance less than £1' do
    fare = Oystercard::FARE
    balance = Oystercard::BALANCE
    oystercard = Oystercard.new
    expect { oystercard.touch_in(station) }.to raise_error("Not enough money on card! Your balance is £#{balance}")
  end

  it 'should deduct fare upon touch out' do
    fare = Oystercard::FARE
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in(station)
    expect{oystercard.touch_out}.to change{oystercard.balance}.by(-fare)
  end

 it 'Remembers the entry station upon touch in' do
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in(station)
  expect(oystercard.entry_station).to eq(station)
end

it 'should set entry_station to nil upon touch out' do
  oystercard = Oystercard.new
  oystercard.top_up(10)
  oystercard.touch_in(station)
  oystercard.touch_out
  expect(oystercard.entry_station).to eq(nil)
end
end
