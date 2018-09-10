class Oystercard
    BALANCE = 0
    MAX_BALANCE = 90
    FARE = 1
    attr_reader :balance, :entry_station

  def initialize(balance = BALANCE)
    @balance = balance
    @max_balance = MAX_BALANCE
    # @status = false
    @entry_station = entry_station
  end

  def top_up(top_up_value)
    fail "Card has reached its £#{@max_balance} limit!" if top_up_value + balance > MAX_BALANCE
    @balance += top_up_value
  end

  def in_journey?
    @entry_station
  end

  def touch_in(station)
    fail "Not enough money on card! Your balance is £#{@balance}" if balance < FARE
    @entry_station = station
  end

  def touch_out
    deduct
    @entry_station = nil
  end

  private
  def deduct
    @balance -= FARE
  end
end
