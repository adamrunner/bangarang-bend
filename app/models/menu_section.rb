class MenuSection < ActiveRecord::Base
  belongs_to :catering_menu
  has_many :menu_items, dependent: :destroy
end
