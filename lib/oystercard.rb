class Oystercard
    BALANCE = 0
    attr_reader :balance

  def initialize(balance = BALANCE)
    @balance = balance
  end

  def top_up(top_up_value)
    @balance += top_up_value
  end
end
