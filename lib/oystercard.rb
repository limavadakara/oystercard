class Oystercard
  attr_accessor :balance
  TOPUP_LIMIT = 90
  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "The maximum balance of #{Oystercard::TOPUP_LIMIT} exceeded" if @balance + value > 90
    @balance += value
  end
end
