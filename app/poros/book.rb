class Book
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(destination, weather_data, book_data)
    @id = nil
    @destination = destination
    @forecast = format_weather(weather_data.current)
    @total_books_found = book_data[:numFound]
    @books = book_data[:docs]
  end
end

private

def format_weather(weather)
  {
    summary: weather[:condition],
    temperature: "#{weather[:temperature]} °F"
  }
end
