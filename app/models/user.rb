class User < ApplicationRecord
  has_many :rates
  has_many :comments
  has_many :likes
  has_many :follows
  has_many :orders
  has_many :mark_books
end
