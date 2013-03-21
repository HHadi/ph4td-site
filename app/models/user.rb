class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :trips, dependent: :destroy
  has_many :followers, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :followers, source: :followed
  has_many :reverse_followers, foreign_key: "followed_id",
           class_name: "Follower", dependent: :destroy
  has_many :followers, through: :reverse_followers, source: :follower
  has_secure_password

  before_save { |user| user.email = email.downcase } 
  before_save :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def feed
    Trip.where("user_id = ?", id)
  end

  def following?(other_user)
    followers.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    followers.create!(followed_id: other_user.id)
  end
  
  def following?(other_user)
    followers.find_by_followed_id(other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
