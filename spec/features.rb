require './lib/oystercard.rb'

# * User Story 1 *
# In order to use public transport
# As a customer
# I want money on my card

# * Feature Test 1 *
# p oystercard = Oystercard.new
# p oystercard.balance

# * User Story 2 *
# In order to keep using public transport
# As a customer
# I want to add money to my card

# * Feature Test 2 *
# p oystercard.top_up(10)

# * User Story 3 *
# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

# * Feature Test 3 *
# p oystercard.top_up(100)

# * User Story 4 *
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

# * Feature Test 4 *
# p oystercard.deduct(4)

# * User Story 5 *
# In order to get through the barriers.
# As a customer
# I need to touch in and out.

# * Feature Test 5 *
# p oystercard.touch_in
# p oystercard.touch_out
# p oystercard.in_journey?


# * User Story 6 *
# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

# * User Story 7 *
# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card

# * Feature Test 6 *
# p oystercard.top_up(3)
# p oystercard.touch_in
# p oystercard.touch_out

# * User Story 8 *
# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

# * Feature Test 8 *
# oystercard.top_up(3)
# oystercard.touch_in(entry_station)

# * User Story 9 *
# In order to know where I have been
# As a customer
# I want to see all my previous trips
it 'it stores the previous trips' do
  card = Oystercard.new
  card.top_up(10)
  card.touch_in("entry")
  card.touch_out("exit")
  expect(card.journeys).to include(["entry", "exit"])

end

# * Feature Test 9 *
# p oystercard.top_up(3)
# p oystercard.touch_in("Shoreditch")
# p oystercard.touch_out("Angel")
# p oystercard.current_journey
# p oystercard.journeys
# p oystercard.touch_in("Kings Cross")
# p oystercard.touch_out("Farringdon")
# p oystercard.current_journey
# p oystercard.journeys
# p oystercard.touch_in("Oxford Circus")
# p oystercard.touch_out("Bond Street")
# p "before efkjlkdfjals;kdjfoskdgfjal;ksdgj;alkdgj;alkd"
# p oystercard.journeys
#
# p "end efkjlkdfjals;kdjfoskdgfjal;ksdgj;alkdgj;alkd"
# p oystercard.current_journey
# p journeys.class?
