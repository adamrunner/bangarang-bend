json.array! @event_items do |event_item|
  json.id event_item.id
  json.name event_item.name
  json.description event_item.description

  json.produce_items event_item.event_produce_items do |produce_item|
    json.id produce_item.id
    json.name produce_item.name
  end
end
