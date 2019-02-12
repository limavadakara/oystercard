class Oystercard
  attr_accessor :balance
  attr_reader :journeys, :entry_station
  TOPUP_LIMIT = 90
  MIN_BALANCE = 1
  def initialize
    @balance = 0
    @journeys = []

  end

  def top_up(value)
    fail "The maximum balance of #{TOPUP_LIMIT} exceeded" if @balance + value > TOPUP_LIMIT
    @balance += value
  end

  def in_journey?
     @entry_station == nil ? false : true
  end

  def touch_in(station)
    raise "Card already touched in" if in_journey?
    raise "Not enough balance" if @balance < MIN_BALANCE

    @entry_station = station
  end

  def touch_out(station)

    deduct(MIN_BALANCE)
    @journeys << {entry_station: @entry_station, exit_station: station}
    @entry_station = nil
  end

private

def deduct(value)
  @balance -= value
end

end
