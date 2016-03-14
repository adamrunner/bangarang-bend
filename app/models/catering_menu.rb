class CateringMenu < ActiveRecord::Base
  belongs_to :page
  has_many :menu_sections, dependent: :destroy
  has_many :menu_items, through: :menu_sections
  before_save :name_lowercase

  def num_of_sections
    self.menu_sections.length
  end

  def num_of_items
    self.menu_items.length
  end

  private
  def name_lowercase
    self.name = self.name.downcase
  end
end
