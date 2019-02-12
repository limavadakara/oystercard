require 'station.rb'
describe Station do

  it 'gets created with a name and zone' do
    station = Station.new("Station_name", 1)
    expect(station).to be_a Station
    expect(station.name).to eq "Station_name"
    expect(station.zone).to eq 1

  end

end
