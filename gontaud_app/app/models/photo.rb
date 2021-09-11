# model created for photos
class Photo < ActiveRecord::Base
    belongs_to :user
end
