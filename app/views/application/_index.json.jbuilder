json.data do
  json.bg_images @bg_images do |bg_image|
    json.id bg_image.id
    json.url bg_image.url
  end
end
