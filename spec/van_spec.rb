require 'van'

describe Van do
  let(:station) { double(:station) }
  let(:bike) { double(:bike) }

  it 'should be able to store bikes' do
    expect(subject.storage).to eq []
  end
end
