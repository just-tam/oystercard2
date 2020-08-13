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

  describe '#deduct' do
    it "Expects money to be deducted from card" do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.deduct 1 }.to change{ subject.balance }.by 1
    end
  end
end
