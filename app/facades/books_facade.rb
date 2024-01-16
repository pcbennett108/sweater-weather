class BooksFacade
  def search_books(location, quantity)
    book_data = BooksService.new.get_books(location, quantity)
    weather_data = WeatherFacade.new(location).forecast
    # require "pry" ; binding.pry
  end
end