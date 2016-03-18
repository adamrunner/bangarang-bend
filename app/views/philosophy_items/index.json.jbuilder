json.array! @philosophy_items do |philosophy_item|
  json.id philosophy_item.id
  json.name philosophy_item.name
  json.description philosophy_item.description
end
