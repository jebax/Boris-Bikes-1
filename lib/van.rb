class Van
  attr_reader :storage

  def initialize
    @storage = []
  end

  def take_working_bikes(garage)
    raise "Van not empty" unless @storage.empty?
    garage.storage.each do |bike|
      @storage << bike if bike.working?
      garage.storage.delete(bike)
    end
  end

  def release_working_bikes(station)
    @storage.each do |bike|
      if bike.working?
        station.docked_bikes << bike
        @storage.delete(bike)
      end
    end
  end

end
