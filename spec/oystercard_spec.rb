require 'oystercard'

describe Oystercard do
  it "Checks that a new card has a balance" do
    expect(subject).to respond_to(:balance)
  end

  it "Checks balance is equal to zero" do
    expect(subject.balance).to eq (0)
  end

  describe '#top_up' do
    it "Expects oystercard to respond to method top_up" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "Expects money to be added to balance" do
      expect { subject.top_up(1) }.to change{ subject.balance }.by 1
    end

    it "Raises error if maximum balance is reached" do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "The maximum balance is £#{maximum_balance}"
    end
  end

    it "Expects oystercard too respond to in_journey? method" do
      expect(subject).to respond_to(:in_journey?)
    end

    describe '#touch_in' do

      let(:station){ double :station }

      context 'card has been touched in with valid balance' do
        before do
          subject.top_up(Oystercard::MAX_BALANCE)
        end

        it "Expects touching in to be in a in a journey" do
          subject.touch_in(station)
          expect(subject).to be_in_journey
        end

        it "Expects oystercard to remember entry station after touching in" do
          subject.touch_in(station)
          expect(subject.entry_station).to eq (station)
        end
      end

      it "Expects error if insufficient funds on card" do
        expect{ subject.touch_in(station) }.to raise_error "You need to top up, mimimum is £1"
      end
    end

    describe '#touch_out' do

      let(:station){ double :station }
      let(:entry_station) { double :station }
      let(:exit_station) { double :station }

      context 'card has been touched in with valid balance' do
        before do
          subject.top_up(Oystercard::MAX_BALANCE)
        end

        it "Expects touching out to not be in a in a journey" do
          subject.touch_in(station)
          subject.touch_out(station)
          expect(subject).not_to be_in_journey
        end

        it "Expects touching out to deduct fare from card balance" do
          subject.touch_in(station)
          expect{ subject.touch_out(station) }.to change{ subject.balance }.by -1
        end

        it "Expects an empty list of journeys" do
          expect(subject.journeys).to be_empty
        end

        let(:journey){ {:entry_station => entry_station, :exit_station => exit_station} }

        it "Expects store a journey" do
          subject.touch_in(entry_station)
          subject.touch_out(exit_station)
          expect(subject.journeys).to include journey
        end

        it "Expects journey to be complete" do
          subject.touch_in(entry_station)
          subject.touch_out(exit_station)
          expect(subject).to be_journey_complete
        end
      end
    end
end
