class Oystercard
    DEFAULT_BALANCE = 0
    attr_reader :default_balance 

  def initialize(default_balance = DEFAULT_BALANCE)
    @default_balance = default_balance
  end

end
