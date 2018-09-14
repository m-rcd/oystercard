 require './lib/journey.rb'
 require './lib/oystercard.rb'
 require './lib/journeylog.rb'
 require './lib/station.rb'

 station1 = Station.new('A', 1)
 station2 = Station.new('B', 2)
 station3 = Station.new('C', 5)
 card = Oystercard.new
 card.top_up(2)
 card.touch_in(station1)
 card.touch_out(station2)
 card.journeylog.history_log
