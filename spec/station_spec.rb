require 'station'

describe Station do

  let(:station){ Station.new("waterloo", 2) }

  it "Expects class station to exist" do
    expect(station).to be_instance_of Station
  end

  it "Expects station to respond to station_name" do
    expect(station).to respond_to (:station_name)
  end

  it "Expects station to respond to station_zone" do
    expect(station).to respond_to (:station_zone)
  end

  it "Can set a station name" do
    new_station = Station.new("Brixton", 2)
    expect(new_station.station_name).to eq "Brixton"
  end

  it "Can set a station zone" do
    new_station = Station.new("Brixton", 2)
    expect(new_station.station_zone).to eq 2
  end
end
