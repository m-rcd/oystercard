# oystercard

Task:
---
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

Getting started
---
1. Create Gemfile
1. Create RSpec conventional files: `rspec --init`

How my app would look like from a perspective user:
---

```rb
[1] pry(main)> require './lib/journey.rb'
=> true
[2] pry(main)> require './lib/oystercard.rb'
=> true
[3] pry(main)> require './lib/journeylog.rb'
=> true
[4] pry(main)> require './lib/station.rb'
=> true
[5] pry(main)> station1 = Station.new('A', 1)
=> #<Station:0x00007fcd4909c270 @name="A", @zone=1>
[6] pry(main)> station2 = Station.new('B', 2)
=> #<Station:0x00007fcd499ac978 @name="B", @zone=2>
[7] pry(main)> station3 = Station.new('C', 5)
=> #<Station:0x00007fcd49126f10 @name="C", @zone=5>
[8] pry(main)> card = Oystercard.new
=> #<Oystercard:0x00007fcd47130a58
 @balance=0,
 @being_used=false,
 @journeylog=
  #<JourneyLog:0x00007fcd471309e0
   @entry_point=nil,
   @exit_point=nil,
   @history_log=[],
   @journey=#<Journey:0x00007fcd471309b8>>,
 @max_balance=90>
[9] pry(main)> card.top_up(2)
=> 2
[10] pry(main)> card.touch_in(station1)
=> #<Station:0x00007fcd4909c270 @name="A", @zone=1>
[11] pry(main)> card.touch_out(station2)
=> 0
[12] pry(main)> card.touch_in(station2)
RuntimeError: Not enough money on card! Your balance is £0
from /Users/mariannerachid/code/makers/course/week2/oystercard/lib/oystercard.rb:21:in `touch_in'
[13] pry(main)> card.top_up(3)
=> 3
[14] pry(main)> card.touch_in(station1)
=> #<Station:0x00007fcd4909c270 @name="A", @zone=1>
[15] pry(main)> card.touch_in(station1)
RuntimeError: Already touched in!
from /Users/mariannerachid/code/makers/course/week2/oystercard/lib/oystercard.rb:20:in `touch_in'
[16] pry(main)> card.touch_out(station3)
=> -2
[17] pry(main)> card.touch_in(station1)
RuntimeError: Not enough money on card! Your balance is -£2
from /Users/mariannerachid/code/makers/course/week2/oystercard/lib/oystercard.rb:21:in `touch_in'
[18] pry(main)> card.journeylog.history_log
=> [{:entry=>#<Station:0x00007fcd4909c270 @name="A", @zone=1>,
  :exit=>#<Station:0x00007fcd499ac978 @name="B", @zone=2>,
  :price=>2},
 {:entry=>#<Station:0x00007fcd4909c270 @name="A", @zone=1>,
  :exit=>#<Station:0x00007fcd49126f10 @name="C", @zone=5>,
  :price=>5}]```
