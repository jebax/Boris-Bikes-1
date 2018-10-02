require "docking_station"

describe DockingStation do
  it "should respond to 'release_bike'" do
    obj = DockingStation.new
    expect(obj).to respond_to(:release_bike)
  end

end
