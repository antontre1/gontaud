require_relative '../uploader/image_uploader.rb'

# model created for photos
class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImagesUploader
end
