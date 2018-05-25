require './lib/station.rb'

describe Station do
  context 'default' do
    it 'can be created' do
      expect { Station.new("zone") }.not_to raise_error
    end

    it 'has a zone on initialization' do
      station = Station.new("zone")
      expect { station.zone }.not_to raise_error
    end
end

  context "#zone" do
    it "returns the station's zone" do
      station = Station.new("Zone 1")
      expect(station.zone).to eq "Zone 1"
    end
  end
end
