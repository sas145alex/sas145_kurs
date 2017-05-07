module BooksHelper
  def show_authors(book)
    book.authors.empty? ? 'не указано' :
      book.authors.pluck(:ln, :author_index).map { |a| a.join('/') }.join('; ')
  end

  def get_shelves(book)
    render('books/get_shelves', book: book)
  end
end
