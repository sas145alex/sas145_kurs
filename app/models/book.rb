class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_many :locations
  has_many :shelves, through: :locations

  validates :name, :isbn, presence: true
  validates :quantity, numericality: { only_integer: true,
    greater_than_or_equal_to: 0, message: "должно быть не отрицательным" }
  validates :volume, numericality: { only_integer: true, greater_than: 0,
    message: "должно быть больше нуля"}, allow_blank: true
  validates :isbn, uniqueness: true



  def get_rack_numbers(shelf_id)
    locations.where(book_id: self.id, shelf_id: shelf_id).pluck(:rack_number)
  end
end
