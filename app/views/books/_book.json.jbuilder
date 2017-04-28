json.extract! book, :id, :name, :volume, :isbn, :quantity, :created_at, :updated_at
json.url book_url(book, format: :json)
