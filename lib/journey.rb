class Journey

attr_reader :entry_station, :exit_station, :journey

MIN_FARE = 1
PENALTY_FARE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    @journey = { :entry_station => @entry_station, :exit_station => @exit_station }
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def journey_complete?
    true if @journey
  end

  def fare
    if journey_complete?
      MIN_FARE
    else
      PENALTY_FARE
   end
  end

end
