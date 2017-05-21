class Author < ActiveRecord::Base
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books

  validates :author_index, :fn, :ln, presence: true
  validates :author_index, length: { minimum: 2 }, allow_blank: true
  validates :author_index, uniqueness: { scope: :ln, message: "уже есть у одного из авторов-софамильцев"}

  def name_with_initial
    "#{fn.first}. #{ln}"
  end

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
