class Location < ActiveRecord::Base
  belongs_to :book
  belongs_to :shelf

  validates :book_id, :shelf_id, :rack_number, presence: true
  validates :rack_number, numericality: { only_integer: true,
    greater_than: 0, message: "должно быть положительным" }
  validates :rack_number, uniqueness: {
    scope: [:book_id, :shelf_id], message: "и остальные поля должны быть уникальными"}
end
