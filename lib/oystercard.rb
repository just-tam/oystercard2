class Oystercard

attr_reader :balance, :entry_station

MIN_BALANCE = 1
MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "The maximum balance is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    fail "You need to top up, mimimum is £1" if @balance < MIN_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_BALANCE)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
