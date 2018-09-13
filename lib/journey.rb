class Journey
  FARE = 1
  PENALTY = 6
  
  def calculate_fare(entry_point, exit_point)
     entry_point && exit_point ? FARE : PENALTY
  end
end
