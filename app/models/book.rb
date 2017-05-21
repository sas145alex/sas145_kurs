class Book < ActiveRecord::Base
  has_many :author_books, dependent: :destroy
    accepts_nested_attributes_for :author_books,
    reject_if: :all_blank, allow_destroy: true
  has_many :authors, through: :author_books
  has_many :locations, dependent: :destroy
  has_many :shelves, through: :locations
    accepts_nested_attributes_for :locations, allow_destroy: true,
      reject_if: proc { |attributes| attributes[:rack_number].blank? }

  validates :name, :isbn, presence: true
  validates :quantity, numericality: { only_integer: true,
    greater_than_or_equal_to: 0, message: "должно быть не отрицательным" }
  validates :volume, numericality: { only_integer: true, greater_than: 0,
    message: "должно быть больше нуля"}, allow_blank: true
  validates :isbn, uniqueness: true
end
