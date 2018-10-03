require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes

  

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "Docking station is empty" if empty?

    @docked_bikes.shift
  end

  def dock(bike)
    raise "Docking station is full" if full?

    @docked_bikes << bike
  end

  private

  def full?
    return true if @docked_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    return true if @docked_bikes.empty?
  end

end
