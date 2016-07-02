json.data do
  json.pages @pages do |page|
    json.id page.id
    json.name page.name
    json.link_name page.link_name
    if page.show_copy_text
      json.copy_text page.copy_text
    end
  end

  json.featured_items @featured_items do |featured_item|
    json.id featured_item.id
    json.name featured_item.name
    json.description featured_item.description
    json.image_url featured_item.image.url
    json.link_url featured_item.link_url
  end

  json.biography_items @biography_items do |biography_item|
    json.id biography_item.id
    json.name biography_item.name
    json.description biography_item.description
    json.image_url biography_item.image.url
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

  json.event_items @event_items do |event_item|
    json.id event_item.id
    json.name event_item.name
    json.description event_item.description

    json.produce_items event_item.event_produce_items do |produce_item|
      json.id produce_item.id
      json.name produce_item.name
    end
  end

  json.philosophy_items @philosophy_items do |philosophy_item|
    json.id philosophy_item.id
    json.name philosophy_item.name
    json.description philosophy_item.description
  end
end
