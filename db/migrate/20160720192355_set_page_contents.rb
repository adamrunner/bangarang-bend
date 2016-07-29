class SetPageContents < ActiveRecord::Migration
  home = Page.find_by(name: 'home')
  home.content << 'featured_items' << 'biography_items' << 'landings'

  services = Page.find_by(name: 'services')
  services.content << 'service_items'

  catering_menus = Page.find_by(name: 'catering_menus')
  catering_menus.content << 'catering_menus'

  events = Page.find_by(name: 'events')
  events.content << 'event_items' << 'event_produce_items'

  philosophy = Page.find_by(name: 'philosophy')
  philosophy.content << 'philosophy_items'

  food_truck = Page.find_by(name: 'food_truck')
  food_truck.content << 'food_truck_image_rows' << 'food_truck_addresses'

  pages = [home, services, catering_menus, events, philosophy, food_truck]

  pages.each do |page|
    page.save
  end
end
