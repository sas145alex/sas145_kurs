class AuthorBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
  accepts_nested_attributes_for :author

  validates :book_id, uniqueness: {
    scope: :author_id, message: "Эта книга и автор уже связаны" }
end
