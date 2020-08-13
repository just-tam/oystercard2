class Oystercard

attr_reader :balance, :entry_station

MIN_BALANCE = 1
MAX_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
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

  def touch_out
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
