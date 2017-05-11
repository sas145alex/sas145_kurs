class Shelf < ActiveRecord::Base
  belongs_to :hall
  accepts_nested_attributes_for :hall

  has_many :locations
  accepts_nested_attributes_for :locations

  has_many :books, through: :locations

  validates :hall_id, :shelf_index, presence: true
  validates :shelf_index, length: { minimum: 2 }
  validates :shelf_index, uniqueness: true
end
