require_relative 'journey'

class JourneyLog

  attr_reader :journeys
  attr_accessor :journey_class

  def initialize(journey_class: )
    @journeys = []
    @journey_class = Journey.new
  end

  def start
    @journey_class.start(station)
  end

  def finish
    @journey_class.finish(station)
    @current_journey = @journeys << @journey_class.journey
  end

  private

  def current_journey
    @current_journey ||= journey_class.new
  end

end
