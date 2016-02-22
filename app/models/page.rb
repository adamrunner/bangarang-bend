class Page < ActiveRecord::Base
  has_many :biography_items
  has_many :event_items
  has_many :catering_menus
  has_many :featured_items
  has_many :philosophy_items
  has_many :service_items

  def content_type
    if self.name === "catering_menus"
      return self.name
    else
      return self.name.singularize << "_items"
    end
  end

  def home_items
    home_items = {
      featured: {name: "featured", featured_items: self.featured_items},
      biography: {name: "biography", biography_items: self.biography_items}
    }
  end

  def page_content
    self.send(self.content_type)
  end
end
