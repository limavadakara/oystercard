class Oystercard
  attr_accessor :balance
  TOPUP_LIMIT = 90
  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    fail "The maximum balance of #{Oystercard::TOPUP_LIMIT} exceeded" if @balance + value > 90
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Card already touched in" if @in_use == true
    @in_use = true
  end


end
