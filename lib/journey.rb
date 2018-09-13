class Journey
  FARE = 1
  PENALTY = 6

  attr_reader :in_use, :entry_point, :exit_point

  def initialize
    @in_use = false
    @entry_point = nil
    @exit_point = nil
  end

  def start_journey(station = nil)
    @entry_point = station
    @in_use = true
  end

  def end_journey(station = nil)
    @exit_point = station
    @in_use = false
  end

  def calculate_fare
     entry_point && exit_point ? FARE : PENALTY
  end
end
