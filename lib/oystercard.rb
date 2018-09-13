class Oystercard
    BALANCE = 0
    MAX_BALANCE = 90
    FARE = 1
    attr_reader :balance, :entry_station, :journey_log, :journey

  def initialize(balance = BALANCE, journey = Journey.new)
    @balance = balance
    @max_balance = MAX_BALANCE
    @journey_log = []
    @journey = journey
  end

  def top_up(top_up_value)
    fail "Card has reached its £#{@max_balance} limit!" if top_up_value + balance > MAX_BALANCE
    @balance += top_up_value
  end

  def touch_in(station)
    fail "Not enough money on card! Your balance is £#{@balance}" if balance < FARE
    journey.start_journey(station)
  end

  def touch_out(station)
    @journey_log << {entry: journey.entry_point, exit: station}
    journey.end_journey(station)  
    deduct(journey.calculate_fare)
  end

  private

  def deduct(amount)

    @balance -= amount
  end
end
