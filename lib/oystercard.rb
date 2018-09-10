class Oystercard
    BALANCE = 0
    MAX_BALANCE = 90
    FARE = 1
    attr_reader :balance, :status
    #attr_accessor :max_balance


  def initialize(balance = BALANCE)
    @balance = balance
    @max_balance = MAX_BALANCE
    @status = false
  end

  def top_up(top_up_value)
    fail "Card has reached its £#{@max_balance} limit!" if top_up_value + balance > MAX_BALANCE
    @balance += top_up_value
  end

  def in_journey?
    @status
  end

 #  def card_full?
 #   @balance > @max_balance
 # end

  def touch_in
    fail "Not enough money on card! Your balance is £#{@balance}" if balance < FARE
    @status = true
  end

  def touch_out
    @status = false
    deduct
  end

  private
  def deduct
    @balance -= FARE
  end

end
