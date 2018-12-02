class User < ApplicationRecord
  has_many :rates
  has_many :comments
  has_many :likes
  has_many :follows
  has_many :orders
  has_many :mark_books

  validates :username, presence: true, length: {maximum: Settings.user.length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.min_length, maximum: Settings.max_length}, allow_nil: true

  has_secure_password
end
