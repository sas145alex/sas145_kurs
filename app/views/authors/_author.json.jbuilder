json.extract! author, :id, :fn, :ln, :sn, :author_index, :created_at, :updated_at
json.url author_url(author, format: :json)
