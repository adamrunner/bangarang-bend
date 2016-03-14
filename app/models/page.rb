class Page < ActiveRecord::Base
  has_many :biography_items
  has_many :event_items
  has_many :event_produce_items
  has_many :catering_menus
  has_many :featured_items
  has_many :philosophy_items
  has_many :service_items
  has_many :landings
  before_save :link_name_lowercase,
              :format_text

  def content_type
    if self.name === "catering_menus" || self.name === "events"
      return self.name
    else
      return self.name.singularize << "_items"
    end
  end

  def events
    events = {
      months: {name: "months", event_items: self.event_items},
      produce: {name: "produce", event_produce_items: self.event_produce_items.order(name: :asc)}
    }
  end

  def home_items
    home_items = {
      featured: {name: "featured", featured_items: self.featured_items},
      biography: {name: "biography", biography_items: self.biography_items}
    }
  end

  def tab
    if self.name === "home"
      return "featured"
    elsif self.name === "events"
      return "months"
    end
  end

  def page_content
    self.send(self.content_type)
  end

  def format_edit_text
    self.copy_text.gsub("<br\/>", "\n") if attribute_present?("copy_text")
  end

  private
  def link_name_lowercase
    self.link_name = self.link_name.downcase
  end

  def format_text
    self.copy_text = self.copy_text.gsub("\n", "<br/>") if attribute_present?("copy_text")
  end
end
