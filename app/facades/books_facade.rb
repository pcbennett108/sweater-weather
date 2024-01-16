class BooksFacade
  def search_books(location, quantity)
    book_data = BooksService.new.get_books(location, quantity)
    weather_data = WeatherFacade.new(location).forecast
    Book.new(location, weather_data, book_data)
    # require "pry" ; binding.pry
  end
end