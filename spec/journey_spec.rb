require 'journey'

describe Journey do
  let(:journey) { described_class.new }
  let(:entry_station) { double('a station', name: 'Aldgate East', zone: 1) }
  let(:exit_station) { double('another station', name: 'Bow road', zone: 2)}

  context '#calculate_fare' do
    it 'FAIL - penalty cost given' do

      expect(journey.calculate_fare(entry_station, nil)).to eq 6
    end

    it 'PASS - normal fare' do

      expect(journey.calculate_fare(entry_station, exit_station)).to eq 1
    end
  end
end
