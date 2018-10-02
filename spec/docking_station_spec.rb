require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "should return a Bike" do
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it "should be working " do
    expect(subject.release_bike.working?).to eq true
  end

end
