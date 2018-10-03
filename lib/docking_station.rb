require_relative 'bike'

class DockingStation

attr_reader :docked_bike

  def initialize
    @docked_bike
  end

  def release_bike
    raise "Docking station is empty" if @docked_bike.nil?
    
    Bike.new
  end

  def dock(bike)
    @docked_bike = bike
  end

end
