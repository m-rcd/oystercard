require 'journey'

describe Journey do
  let(:journey) { described_class.new }
  let(:entry_station) { Station.new('Aldgate East', 1)}
  let(:exit_station) { Station.new('Bow road', 1)}

  context '#start_journey' do
    it 'turn in_use to true' do
      expect { journey.start_journey }.to change{journey.in_use}.from(false).to(true)
    end
  end

  context '#end_journey' do
    it 'turns in_use to false' do
      journey.start_journey
      expect { journey.end_journey }.to change{journey.in_use}.from(true).to(false)
    end
  end

  context '#calculate_fare' do
    it 'FAIL - penalty cost given' do
      journey.start_journey(entry_station)

      expect(journey.calculate_fare).to eq 6
    end

    it 'PASS - normal fare' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station)

      expect(journey.calculate_fare).to eq 1
    end
  end
end
