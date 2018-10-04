require_relative 'bike'
require_relative 'van'

class Garage

  def initialize
    @storage = []
  end

  def storage
    @storage
  end

  def take_bikes(van)
    van.storage.each do |bike|
      @storage << bike
      van.storage.delete(bike)
    end
  end

  def fix_bikes
    @storage.each do |bike|
      bike.working = true
    end
  end
end
