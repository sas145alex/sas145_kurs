class Location < ActiveRecord::Base
  belongs_to :book
  belongs_to :shelf

  validates :rack_number, presence: true
  # validates :book, :shelf, :rack_number, presence: true
  validates :rack_number, numericality: { only_integer: true,
    greater_than: 0, message: "должно быть положительным" }
  validates :rack_number, uniqueness: {
    scope: [:book_id, :shelf_id], message: "и остальные поля должны быть уникальными"}



  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
