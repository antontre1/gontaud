require_relative '../uploader/image_uploader.rb'

class Images_old < ActiveRecord::Base
  mount_uploader :image, ImagesUploader
end