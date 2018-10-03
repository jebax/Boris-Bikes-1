require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "should return a Bike" do
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it "should be working " do
    expect(subject.release_bike.working?).to eq true
  end

  it "should dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should show a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bike).to eq bike
  end

end
