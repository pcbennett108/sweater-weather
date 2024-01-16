class Book
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(destination, weather_data, book_data)
    @id = nil
    @destination = destination
    @forecast = weather_data.current
    @total_books_found = book_data[:numFound]
    @books = book_data[:docs]
  end
end
