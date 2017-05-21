# scaffold
class CreateAuthorBooks < ActiveRecord::Migration
  def change
    create_table :author_books do |t|
      t.references :book, index: true, foreign_key: true, null: false
      t.references :author, index: true, foreign_key: true, null: false
      t.index [:author_id, :book_id], unique: true
      # t.index [:book_id, :author_id]
    end
  end
end
