json.extract! author_book, :id, :book_id, :author_id, :created_at, :updated_at
json.url author_book_url(author_book, format: :json)
