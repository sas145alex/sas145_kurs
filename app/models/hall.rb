class Hall < ActiveRecord::Base
  has_many :shelves, dependent: :destroy

  validates :short_name, :full_name, presence: true
  validates :short_name, uniqueness: true


  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
