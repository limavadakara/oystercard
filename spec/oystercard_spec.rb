require 'oystercard.rb'
describe Oystercard do
  let (:entry_station) { double() }
  it 'gets created with a default balance of 0' do
    expect(subject.balance).to equal 0
  end

  it 'tops-up the balance' do
     expect(subject.top_up(10)).to equal 10
  end

  it 'throws error if balance is topped up to more than £90' do
    expect {subject.top_up(100)}.to raise_error "The maximum balance of #{Oystercard::TOPUP_LIMIT} exceeded"
  end

  it 'indicates if it is in a journey' do
    expect(subject.in_journey?).to equal false
  end

  it 'allows user to touch in' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect(subject.in_journey?).to equal true
  end

  it 'raises error if an already touched-in card is touched in again' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect { subject.touch_in(entry_station) }.to raise_error "Card already touched in"
  end

  it 'allows user to touch out' do
    subject.touch_out
    expect(subject.in_journey?).to equal false
  end

  it 'raise error if it doesnt have minimum balance' do
    expect{ subject.touch_in(entry_station) }.to raise_error "Not enough balance"
  end

  it 'its balance is reduced by the right amount when it is touched out' do
    expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_BALANCE)
  end

  it 'it remembers the entry station when touching in' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to equal entry_station
  end

  it 'forgets entry station on touch out' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out
    expect(subject.entry_station).to equal nil
  end

  it 'gets created with an empty list of journeys' do
    expect(subject.journeys).to be_a Array
  end
end
