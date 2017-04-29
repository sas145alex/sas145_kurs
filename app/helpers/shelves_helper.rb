module ShelvesHelper
  def get_books(shelf)
    render('shelves/get_books', shelf: shelf)
  end
end
