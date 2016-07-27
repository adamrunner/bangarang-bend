class FoodTruckImageRow < ActiveRecord::Base
  belongs_to :page
  mount_uploader :small_image, FoodTruckSmallImageUploader
  mount_uploader :large_image, FoodTruckLargeImageUploader
end
