require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Docking station is empty" if empty?
    chosen_bike = @docked_bikes.first
    raise "Bike is broken!" unless chosen_bike.working?
    chosen_bike
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @docked_bikes << bike
  end



  private

  def full?
    return true if @docked_bikes.length == capacity
  end

  def empty?
    return true if @docked_bikes.empty?
  end

end
