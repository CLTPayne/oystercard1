class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey

  def initialize(balance = START_BALANCE)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @current_journey = []
  end

  def top_up(amount)
    message = "Maximum balance of #{MAX_BALANCE} exceeded"
    raise message if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MIN_FARE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    while in_journey?
      @current_journey = []
      @exit_station = exit_station
      @current_journey.push(entry_station, exit_station)
      @journeys.push(@current_journey)
      @entry_station = nil
     return @current_journey
    end
  end

  def in_journey?
    !!entry_station
  end

  private
  def deduct(fare)
  	@balance -= fare
  end

end
