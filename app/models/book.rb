class Book < ActiveRecord::Base
  # before_validation :check_old

  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors,
      reject_if: :all_blank, allow_destroy: true

  has_many :locations
  has_many :shelves, through: :locations
  accepts_nested_attributes_for :locations, allow_destroy: true,
    reject_if: proc { |attributes| attributes[:rack_number].blank? }

  validates :name, :isbn, presence: true
  validates :quantity, numericality: { only_integer: true,
    greater_than_or_equal_to: 0, message: "должно быть не отрицательным" }
  validates :volume, numericality: { only_integer: true, greater_than: 0,
    message: "должно быть больше нуля"}, allow_blank: true
  validates :isbn, uniqueness: true

  def get_rack_numbers(shelf_id)
    locations.where(book_id: self.id, shelf_id: shelf_id).pluck(:rack_number)
  end

  def check_old
    # to_add = []
    # Location.all.each_with_index do |l, i|
    #   ol = Location.where(book_id: self.id, shelf_id: l.shelf_id, rack_number: l.rack_number).first
    #   raise ol.inspect if !ol.nil?
    #   if ol.present? and ol != l
    #     self.locations[i].mark_for_destruction
    #     self.locations << ol
    #     return false
    #   end
    # end

    # raise "ogogo"
    # to_add = []
    # self.locations.each_with_index do |l, i|
    #   ol = Location.where(shelf_id: l.shelf_id, rack_number: l.rack_number).first
    #   if ol.present? and ol != l
    #     self.locations[i].mark_for_destruction
    #     self.locations << ol
    #   end
    # end
  end
end
