class Api::V1::BooksController < ApplicationController
  def search
    facade = BooksFacade.new.search_books(params[:location], params[:quantity])
    # require "pry" ; binding.pry
    render json: BooksSerializer.new(facade)
  end
end