require 'rails_helper'

RSpec.describe Forecast, type: :poro do
  describe 'Instance Methods', :vcr do
    before(:each) do
      @location = "boston,ma"
      @quantity = 3
      @book_data = BooksService.new.get_books(@location, @quantity)
      @weather = WeatherFacade.new(@location).forecast
      @book = Book.new(@location, @weather, @book_data)
    end

    it 'exists' do
      expect(@book).to be_a(Book)
    end

    it 'has attributes for id, destination, forecast, total books found, and books' do
      expect(@book.id).to eq(nil)
      expect(@book.destination).to eq(@location)
      expect(@book.forecast).to be_a(Hash)
      expect(@book.total_books_found).to be_an(Integer)
      expect(@book.books).to be_an(Array)
    end
  end
end
