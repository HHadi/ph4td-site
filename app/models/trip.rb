class Trip < ActiveRecord::Base
  attr_accessible :description
  
  belongs_to :user
  
  validates :description, presence: true, :length => { :maximum => 140 }
  validates :user_id, presence: true
  
  default_scope order: 'trips.created_at DESC'

end
