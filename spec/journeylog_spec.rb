require 'journeylog'

describe JourneyLog do

let(:journey_class){double :journey_class}
#subject {described_class.new(journey_class: journey_class)}

  it 'should respond to journeys' do
    expect(subject).to respond_to(:journeys)
  end

  it 'should respond to journey_class' do
    expect(subject).to respond_to(:journey_class)
  end

  it 'has no journeys by default' do
    expect(subject.journeys.count).to eq(0)
  end
end
