class Trip < ActiveRecord::Base
  attr_accessible :description
  
  has_many :photos, dependent: :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :photos
  validates :description, presence: true, :length => { :maximum => 140 }
  validates :user_id, presence: true
  
  default_scope order: 'trips.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id) 
  end
end
