class Photo < ActiveRecord::Base
  attr_accessible :description, :lat, :lng, :url, :image
  belongs_to :trip
  mount_uploader :image, ImageUploader
  
end
