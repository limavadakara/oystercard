```
irb
require './lib/oystercard.rb' 
require './lib/station.rb' 
oyster = Oystercard.new
oyster.top_up(10)
entry_station = Station.new("EntryStation", 1)
exit_station = Station.new("ExitStation", 2)
oyster.touch_in(entry_station)
oyster.touch_out(exit_station)
oyster.journeys

