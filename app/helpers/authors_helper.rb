module AuthorsHelper
  def books_array(author)
    author.books.empty? ? 'не указано' :
      author.books.pluck(:name, :isbn).map { |a| a.join('/') }.join('; ')
  end
end
