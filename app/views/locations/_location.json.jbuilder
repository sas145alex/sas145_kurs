json.extract! location, :id, :book_id, :shelf_id, :rack_number, :created_at, :updated_at
json.url location_url(location, format: :json)
