class Oystercard
    BALANCE = 0
    MAX_BALANCE = 90
    FARE = 1
    attr_reader :balance, :entry_station, :journeylog, :journey

  def initialize(balance = BALANCE, journey = Journey.new, journeylog = JourneyLog.new)
    @balance = balance
    @max_balance = MAX_BALANCE
    @journey = journey
    @journeylog = journeylog
  end

  def top_up(top_up_value)
    fail "Card has reached its £#{@max_balance} limit!" if top_up_value + balance > MAX_BALANCE
    @balance += top_up_value
  end

  def touch_in(station)
    fail "Not enough money on card! Your balance is £#{@balance}" if balance < FARE
    journeylog.start_tracking(station)
  end

  def touch_out(station)
    journeylog.stop_tracking(station)
    deduct(journey.calculate_fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
