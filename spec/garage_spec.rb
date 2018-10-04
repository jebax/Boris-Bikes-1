require 'garage'
require 'bike'
require 'pry'


describe Garage do
  let(:bike) { double(:bike) }
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
      broken_bike = Bike.new
      broken_bike.report_as_broken
      subject.storage << broken_bike
      subject.fix_bikes
      expect(broken_bike.working?).to eq true
    end
  end
end
