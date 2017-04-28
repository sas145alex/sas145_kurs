module BooksHelper
  def authors_array(book)
    book.authors.empty? ? 'не указано' :
      book.authors.pluck(:ln, :author_index).map { |a| a.join('/') }.join('; ')
  end
end
