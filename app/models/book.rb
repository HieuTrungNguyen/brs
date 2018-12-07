class Book < ApplicationRecord
  belongs_to :category, optional: true

  has_many :rates
  has_many :comments
  has_many :likes
  has_many :author_books
  has_many :mark_books
  has_many :order_details

  scope :list_book, ->{select :id, :name, :price, :image, :created_id, :category_id}
end
