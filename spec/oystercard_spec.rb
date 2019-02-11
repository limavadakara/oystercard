require 'oystercard.rb'
describe Oystercard do
  it 'gets created with a default balance of 0' do
    expect(subject.balance).to equal 0
  end

  it 'tops-up the balance' do
     expect(subject.top_up(10)).to equal 10
  end

  it 'throws error if balance is topped up to more than £90' do
    expect {subject.top_up(100)}.to raise_error "The maximum balance of #{Oystercard::TOPUP_LIMIT} exceeded"
  end



end
