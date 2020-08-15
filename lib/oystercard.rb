require_relative 'journey'
require_relative 'journeylog'
require_relative 'station'

class Oystercard

attr_reader :balance, :entry_station, :exit_station, :journeys
attr_accessor :journeylog

MIN_BALANCE = 1
MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journeylog = JourneyLog.new
    #@journey = Journey.new
  end

  def top_up(amount)
    fail "The maximum balance is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You need to top up, mimimum is £1" if @balance < MIN_BALANCE
    #@journey.start(station)
    @journeylog.start_journey(station)
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @journeylog.finish_journey(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
