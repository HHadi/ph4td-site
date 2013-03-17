class Trip < ActiveRecord::Base
  attr_accessible :description, :user_id
  belongs_to :user
  validates :description, :length => { :maximum => 140 } 
end
