require_relative 'bike'

class DockingStation

attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "Docking station is empty" if @docked_bikes.empty?

    @docked_bikes.shift
  end

  def dock(bike)
    raise "Docking station is full" if @docked_bikes.length == 20

    @docked_bikes << bike
  end

end
