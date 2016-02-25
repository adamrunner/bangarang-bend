class FeaturedItem < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_one :image, as: :imageable, dependent: :destroy
  belongs_to :page
end
