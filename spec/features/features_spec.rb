require './lib/oystercard.rb'

describe 'Oystercard' do

  subject(:card) { Oystercard.new }
  let(:entry_station) { double :entry_station}
  let(:exit_station) {double :exit_station}

# * User Story 1 *
# In order to use public transport
# As a customer
# I want money on my card

  it 'stores a balance' do
    expect { card.balance }.not_to raise_error
  end

# * User Story 2 *
# In order to keep using public transport
# As a customer
# I want to add money to my card

  it 'allows customer to top up' do
    expect{ card.top_up(5)}.to change{card.balance}.by(5)
  end

# * Feature Test 2 *
# p oystercard.top_up(10)

# * User Story 3 *
# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

  it 'raises error when balance is over 90' do
    card.top_up(50)
    expect { card.top_up(50) }.to raise_error "Maximum balance of #{Oystercard::MAX_BALANCE} exceeded"
  end

# * Feature Test 3 *
# p oystercard.top_up(100)

# * User Story 4 *
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

  it 'when touch out, it deducts minimum fare from balance' do
    card.top_up(10)
    card.touch_in(entry_station)
    expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Oystercard::MIN_FARE)
  end

# * User Story 5 *
# In order to get through the barriers.
# As a customer
# I need to touch in and out.

# ** Behaviour was tested implicitly in the past test **

# * User Story 6 *
# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

  it 'when touched in, raises error if balance is below min fare' do
    expect { card.touch_in(entry_station) }.to raise_error "Insufficient funds"
  end

# * User Story 7 *
# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card

  it 'deducts the fare from balance at touch out' do
    card.top_up(10)
    card.touch_in(entry_station)
    expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Oystercard::MIN_FARE)
  end

# * User Story 8 *
# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

  it 'records journey info on touch out for every journey' do
    card.top_up(10)
    card.touch_in("Aldgate")
    card.touch_out("Tottenham Court Road")
    expect(card.current_journey).to eq ["Aldgate", "Tottenham Court Road"]
  end

# * User Story 9 *
# In order to know where I have been
# As a customer
# I want to see all my previous trips

  it 'it stores the previous trip' do
    card.top_up(10)
    card.touch_in("entry")
    card.touch_out("exit")
    expect(card.journeys).to include(["entry", "exit"])
  end

  it 'journeys stores all of the previous trips' do
    card.top_up(30)
    card.touch_in("Aldgate")
    card.touch_out("Tottenham Court Road")
    card.touch_in("Shoreditch")
    card.touch_out("Angel")
    card.touch_in("Bow")
    card.touch_out("Bethan Green")
    expect(card.journeys).to eq [["Aldgate", "Tottenham Court Road"], ["Shoreditch", "Angel"], ["Bow", "Bethan Green"]]
  end

end
