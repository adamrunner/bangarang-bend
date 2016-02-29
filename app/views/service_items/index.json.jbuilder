json.array! @service_items do |service_item|
  json.id service_item.id
  json.name service_item.name
  json.description service_item.description
end
