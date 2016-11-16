json.data do
  json.pages @pages do |page|
    json.id page.id
    json.name page.name
    json.link_name page.link_name
    if page.show_copy_text
      json.copy_text page.copy_text
    end
    #NOTE this is the only page that has nested_links so I to just manually set it
    if page.name === 'catering_menus'
      json.nested_links true
      json.singularized page.name.singularize
    end
  end

  json.landing do
    json.image_url @landing.image.landing.url
  end

  json.address do
    json.link_url @food_truck_address.link_url
    json.description @food_truck_address.description
  end

  json.instagram_images @instagram_images do |instagram_image|
    json.id instagram_image.id
    json.thumbnail instagram_image.thumbnail
    json.low_resolution instagram_image.low_resolution
    json.standard_resolution instagram_image.standard_resolution
  end

  json.featured_items @featured_items do |featured_item|
    json.id featured_item.id
    json.name featured_item.name
    json.description featured_item.description
    json.image_url featured_item.image.featured_image.url
    json.link_url featured_item.link_url
  end

  json.biography_items @biography_items do |biography_item|
    json.id biography_item.id
    json.name biography_item.name
    json.description biography_item.description
    json.image_url biography_item.image.biography_image.url
  end

  json.menus @menus do |menu|
    json.id menu.id
    json.name menu.name
    json.description menu.description

    json.menu_sections menu.menu_sections do |menu_section|
      json.id menu_section.id
      json.name menu_section.name
      json.description menu_section.description

      json.menu_items menu_section.menu_items do |menu_item|
        json.id menu_item.id
        json.name menu_item.name
        json.choices menu_item.choices
        json.price menu_item.price
      end
    end
  end

  json.service_items @service_items do |service_item|
    json.id service_item.id
    json.name service_item.name
    json.description service_item.description
  end

  json.farms @farms do |farm|
    json.id farm.id
    json.name farm.name
    json.description farm.description
    json.url farm.url
    json.image_url farm.farm_image.url
  end

  json.philosophy_items @philosophy_items do |philosophy_item|
    json.id philosophy_item.id
    json.name philosophy_item.name
    json.description philosophy_item.description
  end

  json.food_truck_image_rows @food_truck_image_rows do |food_truck_image_row|
    json.id food_truck_image_row.id
    json.small_image food_truck_image_row.small_image.small_image.url
    json.large_image food_truck_image_row.large_image.large_image.url
  end

end
