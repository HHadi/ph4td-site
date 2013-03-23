class Photo < ActiveRecord::Base
  attr_accessible :description, :lat, :lng, :url
end
