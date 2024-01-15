class Api::V1::MunchiesController < ApplicationController
  def index
    weather_data = WeatherFacade.new(params[:destination]).forecast

    munchies_data = MunchiesFacade.new(params[:destination], params[:food]).munchies
    require 'pry'; binding.pry
  end
end