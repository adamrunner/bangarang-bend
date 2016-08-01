class SetPageContents < ActiveRecord::Migration
  Page.reset_column_information
  
  home = Page.find_by(name: 'home')
  services = Page.find_by(name: 'services')
  catering_menus = Page.find_by(name: 'catering_menus')
  events = Page.find_by(name: 'events')
  philosophy = Page.find_by(name: 'philosophy')
  food_truck = Page.find_by(name: 'food_truck')

  home.content << 'featured_items' << 'biography_items' << 'landings'

  services.content << 'service_items'

  catering_menus.content << 'catering_menus'

  events.content << 'event_items' << 'event_produce_items'

  philosophy.content << 'philosophy_items'

  food_truck.content << 'food_truck_image_rows' << 'food_truck_addresses'

  pages = [home, services, catering_menus, events, philosophy, food_truck]

  pages.each do |page|
    page.save
  end
end
