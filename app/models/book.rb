class Book < ApplicationRecord
  include Filterable

  belongs_to :category, optional: true

  has_many :rates
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :author_books
  has_many :mark_books
  has_many :order_details
  has_many :favorites

  scope :list_book, ->{select :id, :name, :price, :image, :created_id, :category_id}
  scope :search_name, -> search_name {where "name LIKE ?", "%#{search_name}%"}
  scope :category_id, -> category_id {where category_id: category_id}
end
