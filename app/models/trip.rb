class Trip < ActiveRecord::Base
  attr_accessible :description, :userid
  validates :description, :length => { :maximum => 10 } 
end
