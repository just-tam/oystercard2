require 'oystercard'

describe Oystercard do
  it "Checks that a new card has a balance" do
    expect(subject).to respond_to(:balance)
  end

  it "Checks balance is equal to zero" do
    expect(subject.balance).to eq (0)
  end

  it "Expects oystercard to respond to method top_up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end
end
