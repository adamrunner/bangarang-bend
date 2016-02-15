class CateringMenu < ActiveRecord::Base
  belongs_to :page
  has_many :menu_sections, dependent: :destroy
  has_many :menu_items, through: :menu_sections
end
