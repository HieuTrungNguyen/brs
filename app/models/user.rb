class User < ApplicationRecord
  attr_reader :remember_token

  has_many :rates
  has_many :comments
  has_many :likes
  has_many :favorites
  has_many :follows
  has_many :orders
  has_many :mark_books
  has_many :liked, through: :likes, source: :book
  has_many :favorited, through: :favorites, source: :book

  validates :username, presence: true, length: {maximum: Settings.name.length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.password.minimum, maximum: Settings.password.maximum},
    allow_nil: true

  has_secure_password

  class << self
    def digest string
      cost =
        if ActiveModel::SecurePassword.min_cost
          BCrypt::Engine::MIN_COST
        else
          BCrypt::Engine.cost
        end
      BCrypt::Password.create string, cost: cost
    end
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    @remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attributes remember_digest: nil
  end

  def like book
    liked << book
  end

  def unlike book
    liked.destroy book
  end

  def liked? book
    liked.include? book
  end

  def favorite book
    favorited << book
  end

  def unfavorite book
    favorited.destroy book
  end

  def favorited? book
    favorited.include? book
  end
end
