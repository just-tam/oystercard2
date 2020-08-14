class Oystercard

attr_reader :balance, :entry_station, :exit_station, :journeys

MIN_BALANCE = 1
MAX_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "The maximum balance is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "You need to top up, mimimum is £1" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @exit_station = station
    @journey = { :entry_station => @entry_station, :exit_station => @exit_station }
    @journeys << @journey
    @entry_station = nil
  end

  def journey_complete?
    if @journey
      true
    end
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
