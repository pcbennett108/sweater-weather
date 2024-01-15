require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  describe 'based off of a latitude and longitude' do
    it 'returns the current weather data' do
      lat = 39.74001
      lon = -104.99202
      service = WeatherService.new(lat, lon)
      response = service.get_forecast

      expect(response).to have_key(:location)
      expect(response[:location]).to be_a(Hash)
      
      location = response[:location]

      expect(location).to have_key(:name)
      expect(location[:name]).to be_a(String)
      expect(location).to have_key(:region)
      expect(location[:region]).to be_a(String)
      expect(location).to have_key(:country)
      expect(location[:country]).to be_a(String)
      expect(location).to have_key(:lat)
      expect(location[:lat]).to be_a(Float)
      expect(location).to have_key(:lon)
      expect(location[:lon]).to be_a(Float)
      expect(location).to have_key(:localtime)
      expect(location[:localtime]).to be_a(String)

      expect(response).to have_key(:current)
      expect(response[:current]).to be_a(Hash)
      
      current = response[:current]

      expect(current).to have_key(:last_updated)
      expect(current[:last_updated]).to be_a(String)
      expect(current).to have_key(:temp_c)
      expect(current[:temp_c]).to be_a(Float)
      expect(current).to have_key(:temp_f)
      expect(current[:temp_f]).to be_a(Float)
      expect(current).to have_key(:is_day)
      expect(current[:is_day]).to be_an(Integer)

      expect(current).to have_key(:condition)
      expect(current[:condition]).to be_a(Hash)
      expect(current[:condition]).to have_key(:text)
      expect(current[:condition][:text]).to be_a(String)
      expect(current[:condition]).to have_key(:icon)
      expect(current[:condition][:icon]).to be_a(String)
      expect(current[:condition]).to have_key(:code)
      expect(current[:condition][:code]).to be_a(Integer)

      expect(current).to have_key(:wind_mph)
      expect(current[:wind_mph]).to be_a(Float)
      expect(current).to have_key(:wind_kph)
      expect(current[:wind_kph]).to be_a(Float)
      expect(current).to have_key(:wind_degree)
      expect(current[:wind_degree]).to be_a(Integer)
      expect(current).to have_key(:wind_dir)
      expect(current[:wind_dir]).to be_a(String)
      expect(current).to have_key(:pressure_mb)
      expect(current[:pressure_mb]).to be_a(Float)
      expect(current).to have_key(:pressure_in)
      expect(current[:pressure_in]).to be_a(Float)
      expect(current).to have_key(:precip_mm)
      expect(current[:precip_mm]).to be_a(Float)
      expect(current).to have_key(:precip_in)
      expect(current[:precip_in]).to be_a(Float)
      expect(current).to have_key(:humidity)
      expect(current[:humidity]).to be_a(Integer)
      expect(current).to have_key(:cloud)
      expect(current[:cloud]).to be_a(Integer)
      expect(current).to have_key(:feelslike_c)
    end
  end
end