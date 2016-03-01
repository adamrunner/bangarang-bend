json.menu_sections @catering_menu.menu_sections do |menu_section|
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
