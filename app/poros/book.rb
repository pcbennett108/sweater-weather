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
    @books = book_results(book_data[:docs])
  end
end

private

def format_weather(weather)
  {
    summary: weather[:condition],
    temperature: "#{weather[:temperature]} °F"
  }
end

def book_results(book_data)
  book_data.map do |book|
    format_book(book)
  end
end

def format_book(book)
  {
    author_name: book[:author_name],
    title: book[:title],
    publisher: book[:publisher]
  }
end

