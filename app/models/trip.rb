class Trip < ActiveRecord::Base
  attr_accessible :description
  
  belongs_to :user
  
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
