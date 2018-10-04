require 'van'

describe Van do
  let(:station) { double(:station) }
  let(:bike) { double(:bike) }
  let(:garage) { double(:garage) }

  it 'should be able to store bikes' do
    expect(subject.storage).to eq []
  end

  describe "#take_working_bikes" do
    it "should take bikes from a garage" do
      allow(garage).to receive(:storage).and_return [bike]
      allow(bike).to receive(:working?).and_return true
      subject.take_working_bikes(garage)
      expect(subject.storage).to eq [bike]
    end

    it "should not take a broken bike" do
      allow(garage).to receive(:storage).and_return [bike]
      allow(bike).to receive(:working?).and_return false
      subject.take_working_bikes(garage)
      expect(subject.storage).to eq []
    end

    it "should not take bikes unless empty" do
      subject.storage << bike
      expect {subject.take_working_bikes(garage)}.to raise_error "Van not empty"
    end
  end

  describe "#release_working_bikes" do
    it "should release a working bike to a station" do
      allow(bike).to receive(:working?).and_return true
      allow(station).to receive(:docked_bikes).and_return []
      subject.storage << bike
      subject.release_working_bikes(station)
      expect(station.docked_bikes).to eq [bike]
    end
  end
end
