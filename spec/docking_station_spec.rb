require "docking_station"

describe DockingStation do

  describe "#release_bike" do
    it { is_expected.to respond_to :release_bike}

    it "should return a Bike" do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end

    it "should release a working bike" do
      subject.dock(Bike.new)
      expect(subject.release_bike.working?).to eq true
    end

    it "should raise an error if dock is empty" do
      expect {subject.release_bike}.to raise_error("Docking station is empty")
    end

    it "should raise an error if a bike is broken" do
      bike = Bike.new
      bike.report_as_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "Bike is broken!"
    end
  end

  it "should dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should show a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [bike]
  end

  it "dock(bike) should raise an error" do
    subject.capacity.times { subject.dock(Bike.new) }
    expect {subject.dock(Bike.new)}.to raise_error("Docking station is full")
  end

  it "should have a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "capacity can be set" do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

end
