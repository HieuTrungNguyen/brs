class Author < ApplicationRecord
  has_many :author_books

  validates :name, presence: true
  validates :birth_year, presence: true
  validates :phone, presence: true, length: {maximum: 20}
  validates :address, presence: true, length: {maximum: 255}

  scope :list_author, ->{select(:id, :name, :birth_year, :phone, :address).
    order name: :asc}
end
