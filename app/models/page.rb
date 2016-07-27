class Page < ActiveRecord::Base
  serialize :content, Array
  has_many :biography_items
  has_many :event_items
  has_many :event_produce_items
  has_many :catering_menus
  has_many :featured_items
  has_many :philosophy_items
  has_many :service_items
  has_many :landings
  has_many :food_truck_image_rows
  has_one  :food_truck_address
  before_save :link_name_lowercase,
              :format_text

  def default_tab
    self.content.first
  end

  def page_content
    page_content = {}
    self.content.each do |item|
      items = self.send(item)
      if items.respond_to?('first') && items.first.respond_to?('position')
        page_content[item.to_sym] = items.order(position: :asc)
      else
        page_content[item.to_sym] = items
      end
    end
    page_content
  end

  def format_edit_text
    self.copy_text.gsub("<br\/>", "\n") if attribute_present?("copy_text")
  end

  private
  def link_name_lowercase
    self.link_name = self.link_name.downcase
    self.link_name = self.link_name.strip
  end

  def format_text
    self.copy_text = self.copy_text.gsub("\n", "<br/>") if attribute_present?("copy_text")
  end
end
