require_relative 'journey'

class JourneyLog

  attr_reader :journeys
  attr_accessor :journey_class

  def initialize
    @journeys = []
    @journey_class = Journey.new
    @current_journey = nil
  end

  def start_journey(station)
    @journey_class.start(station)
  end

  def finish_journey(station)
    @journey_class.finish(station)
    @journeys << @journey_class.journey
    #@current_journey <<  @journey_class.journeys[0][:exit_station]
  end

  private

  def current_journey
    @current_journey ||= journey_class.new
  end

end
