class BooksFacade
  def search_books(location, quantity)
    book = BooksService.new.get_books(location, quantity)
  end
end