require 'rails_helper'

RSpec.describe RoadTripFacade, type: :facade do
  describe 'Instance Methods', :vcr do
    let(:origin) { "Denver, CO" } 
    let(:destination) { "Boston, MA" } 
    let(:facade) { RoadTripFacade.new(origin, destination) }

    it 'exists' do
      expect(facade).to be_a(RoadTripFacade)
    end

    it 'can find needed route data' do
      data = facade.send(:route_data)
      
      expect(data[:formattedTime]).to eq("27:33:06")
      expect(data[:time]).to eq(99186)
    end
  end
end