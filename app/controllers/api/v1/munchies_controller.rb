class Api::V1::MunchiesController < ApplicationController
  def index
    weather_data = WeatherFacade.new.forecast(params[:destination])

    munchies_data = (MunchiesFacade.new.food_find(params[:destination], params[:food]))
    # require 'pry'; binding.pry
    render json: MunchiesSerializer.data(munchies_data, params[:destination], weather_data), status: :ok
  end
end