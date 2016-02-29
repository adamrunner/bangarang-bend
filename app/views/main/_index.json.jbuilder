json.data do
  json.featured_items @featured_items do |featured_item|
    json.id featured_item.id
    json.name featured_item.name
    json.description featured_item.description
    json.image_url featured_item.image.url
  end

  json.biography_items @biography_items do |biography_item|
    json.id biography_item.id
    json.name biography_item.name
    json.description biography_item.description
    json.image_url biography_item.image.url
  end
end
