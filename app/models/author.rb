class Author < ActiveRecord::Base
  has_and_belongs_to_many :books

  validates :author_index, :fn, :ln, presence: true
  validates :author_index, length: { minimum: 2 }, allow_blank: true
  validates :author_index, uniqueness: { scope: :ln, message: "уже есть у одного из авторов-софамильцев"}

  def name_with_initial
    "#{fn.first}. #{ln}"
  end
end
