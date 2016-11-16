class InstagramDataJob < Struct.new(:auth_id) do
  require 'curb'

  def enqueue(job)

  end

  def perform
    instagram_auth = InstagramAuth.find_by(id: auth_id)
    access_token = instagram_auth.access_token
    result = Curl.get "https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}"
    result = JSON.parse(result.body_str)
    images = []

    result["data"].each do |media|
      image = {
        thumbnail: media["images"]["thumbnail"]["url"],
        low_resolution: media["images"]["low_resolution"]["url"],
        standard_resolution: media["images"]["standard_resolution"]["url"]
      }
      images.push(image)
    end

    if instagram_auth.instagram_images.any?
      new_images = instagram_auth.instagram_images.build(images)
      instagram_auth.instagram_images.replace(new_images)
    else
      instagram_auth.instagram_images.create!(images)
    end
  end

end
end
