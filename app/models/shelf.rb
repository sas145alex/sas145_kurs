class Shelf < ActiveRecord::Base
  belongs_to :hall

  validates :hall_id, :shelf_index, presence: true
  validates :shelf_index, length: { minimum: 2 }
  validates :shelf_index, uniqueness:
    { scope: :hall_id, message: "уже присутствует в данном зале" }
end
