require 'garage'
require 'pry'
require 'bike'


describe Garage do
  let(:bike) { double(:bike, working: false) }
  let(:van) { double(:van) }

  it 'should be able to store bikes' do
    expect(subject.storage).to eq []
  end

  describe "#take_bikes" do
    it 'should be able to take bikes from a van' do
      allow(van).to receive(:storage).and_return []
      van.storage << bike
      subject.take_bikes(van)
      expect(subject.storage).to eq [bike]
    end
  end

  describe "#fix_bikes" do
    it 'should be able to fix broken bikes' do
      bike_2 = Bike.new
      bike_2.report_as_broken
      subject.storage << bike_2
      subject.fix_bikes
      expect(bike_2.working).to eq true
    end
  end
end
