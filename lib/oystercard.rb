require_relative 'journey'

class Oystercard

attr_reader :balance, :entry_station, :exit_station, :journeys

MIN_BALANCE = 1
MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    fail "The maximum balance is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up, mimimum is £1" if @balance < MIN_BALANCE
    @journey.start(station)
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @journey.finish(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
