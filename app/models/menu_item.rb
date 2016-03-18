class MenuItem < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  has_one :catering_menu, through: :menu_section
  belongs_to :menu_section
end
