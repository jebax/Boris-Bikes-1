require "docking_station"

describe DockingStation do
  let(:bike) { double(:bike) }

  describe "#release_bike" do
    it { is_expected.to respond_to :release_bike}

    it "should return a Bike" do
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return true
      expect(subject.release_bike).to eq bike
    end

    it "should release a working bike" do
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return true
      expect(subject.release_bike.working?).to eq true
    end

    it "should raise an error if dock is empty" do
      expect {subject.release_bike}.to raise_error("Docking station is empty")
    end

    it "should raise an error if a bike is broken" do
      allow(bike).to receive(:working?).and_return false
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "Bike is broken!"
    end
  end

  describe "#dock" do
    it "should dock a bike" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "should show a docked bike" do
      subject.dock(bike)
      expect(subject.docked_bikes).to eq [bike]
    end

    it "dock(bike) should raise an error if full" do
      subject.capacity.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error("Docking station is full")
    end

    it 'should dock a broken bike' do
      allow(bike).to receive(:working?).and_return false
      subject.dock(bike)
      expect(subject.docked_bikes).to eq [bike]
    end
  end

  it "should have a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "capacity can be set" do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

end
