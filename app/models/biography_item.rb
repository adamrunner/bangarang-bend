class BiographyItem < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :page
end
