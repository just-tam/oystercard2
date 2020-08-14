class Station

  attr_accessor :station_name
  attr_accessor :station_zone

  def initialize(name, zone)
    @station_name = name
    @station_zone = zone
  end
end
