class Oystercard

attr_reader :balance

MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "The maximum balance is £90" if @balance + amount > MAX_BALANCE
    @balance += amount
  end
end
