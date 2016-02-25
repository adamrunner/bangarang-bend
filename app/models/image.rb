class Image < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :imageable, polymorphic: true
end
