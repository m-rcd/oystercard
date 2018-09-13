require 'oystercard'

describe Oystercard do

  let (:in_station){ double :station }
  let (:out_station) { double :station }
  let(:journey) { double :journey , end_journey: false, start_journey: true}

 context '#top_up' do
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
 end

context '#touch_in' do
  it 'raises error when not enough money' do
    fare = Oystercard::FARE
    balance = Oystercard::BALANCE
    oystercard = Oystercard.new

    expect { oystercard.touch_in(in_station) }.to raise_error("Not enough money on card! Your balance is £#{balance}")
  end

  it 'returns station on touch in' do
   oystercard = Oystercard.new
   oystercard.top_up(10)
   oystercard.touch_in(in_station)


   expect(journey.start_journey(in_station)).to eq true
 end
end

 context '#touch_out' do
   it 'should deduct fare upon touch out' do
     oystercard = Oystercard.new
     oystercard.top_up(10)
     oystercard.touch_in(in_station)

     allow(journey).to receive(:calculate_fare) {1}
     expect{oystercard.touch_out(out_station)}.to change{oystercard.balance}.by(-1 )
   end

   it 'stores one journey into journey_log' do
     oystercard = Oystercard.new
     oystercard.top_up(10)
     oystercard.touch_in(in_station)
     oystercard.touch_out(out_station)

     expect(oystercard.journey_log).to eq ([{entry: in_station, exit: out_station }])
   end
 end

end
