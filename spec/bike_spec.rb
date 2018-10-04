require "docking_station"
describe Bike do
  it { is_expected.to respond_to :working? }

  describe "#report_as_broken" do
    it 'should log a bike as not working' do
      subject.report_as_broken
      expect(subject.working?).to eq false
    end
  end
end
