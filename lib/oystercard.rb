class Oystercard
  attr_accessor :balance, :entry_station
  TOPUP_LIMIT = 90
  MIN_BALANCE = 1
  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    fail "The maximum balance of #{TOPUP_LIMIT} exceeded" if @balance + value > TOPUP_LIMIT
    @balance += value
  end

  def in_journey?
    @in_use
  end

  def touch_in(station)
    raise "Card already touched in" if in_journey?
    raise "Not enough balance" if @balance < MIN_BALANCE
    @in_use = true
    @entry_station = station
  end

  def touch_out
    @in_use = false
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

private

def deduct(value)
  @balance -= value
end

end
