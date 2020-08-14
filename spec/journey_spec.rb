require 'journey'

describe Journey do

  let(:station){ double :station }

  it "Expects Journey to respond to in_journey? method" do
    expect(subject).to respond_to(:in_journey?)
  end

  describe '#start' do

    it "Expects starting a journey to be in a in a journey" do
      subject.start(station)
      expect(subject).to be_in_journey
    end

    it "Expects oystercard to remember entry station after starting" do
      subject.start(station)
      expect(subject.entry_station).to eq (station)
    end
  end

  describe '#finish' do
    it "Expects touching out to not be in a in a journey" do
      subject.start(station)
      subject.finish(station)
      expect(subject).not_to be_in_journey
    end
  end

  it "Expects an empty list of journeys" do
    expect(subject.journey).to eq nil
  end

  let(:journey){ {:entry_station => entry_station, :exit_station => exit_station} }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it "Expects store a journey" do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.journey).to include journey
  end

  it "Expects journey to be complete" do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject).to be_journey_complete
  end

  describe '#fare' do
    it "expects penalty fare to be charged" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it "expects minimum fare to be deducted after touching in and out" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.fare).to eq Journey::MIN_FARE
    end
  end

end
