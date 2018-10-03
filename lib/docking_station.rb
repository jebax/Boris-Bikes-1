require_relative 'bike'

class DockingStation

attr_reader :docked_bike

  def initialize
    @docked_bike
  end

  def release_bike
    raise "Docking station is empty" if @docked_bike.nil?

    @docked_bike
  end

  def dock(bike)
    raise "Docking station is full" if !@docked_bike.nil?

    @docked_bike = bike
  end

end
