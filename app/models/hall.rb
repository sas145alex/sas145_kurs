class Hall < ActiveRecord::Base
  has_many :shelves, dependent: :destroy

  validates :short_name, :full_name, presence: true
  validates :short_name, uniqueness: true
end
