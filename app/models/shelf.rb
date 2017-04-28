class Shelf < ActiveRecord::Base
  belongs_to :hall

  validates :hall_id, :shelf_index, presence: true
  validates :shelf_index, length: { minimum: 2 }
  validates :shelf_index, uniqueness: true
end
