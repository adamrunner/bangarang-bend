class InstagramDataJob
  require 'curb'

  # NOTE this job talks to the Instagram API
  # for more information on expected requests & responses check out
  # https://www.instagram.com/developer/endpoints/

  def perform
    # grab the newest InstagramAuth from the DB
    instagram_auth = InstagramAuth.last

    # end job if no InstagramAuth was found or if it's unauthorized
    return if !instagram_auth || !instagram_auth.authorized

    access_token = instagram_auth.access_token
    instagram_images = instagram_auth.instagram_images

    # send request to instagram api and JSON.parse the response
    response = Curl.get "https://api.instagram.com/v1/users/self/media/recent/?access_token=#{access_token}"
    response = JSON.parse(response.body_str)

    # check resopnse for success or error code
    case response["meta"]["code"]
    when 200 # success
      # if 200 code comes back in response it means account is authorized
      # prepare image data from JSON parsed response for ActiveRecord
      images = parse_images(response)
      # create or update the instagram_auth.instagram_images collection
      create_new_or_replace_old_images(images, instagram_auth)
    when 400 # error
      # if 400 code comes back in response it means account is not authorized
      # update instagram_auth accordingly
      # TODO trigger an email to notify user that the stored authentication credentials are no longer valid
      instagram_auth.update( authorized: false )
    end
  end

  def error(job, exception)
    puts exception
  end


  private

  def parse_images(response)
    images = []
    response["data"].each_with_index do |media, index|
      image = {
        # set id to index + 1 so we always update the same records in database
        id: index + 1,
        thumbnail: media["images"]["thumbnail"]["url"],
        low_resolution: media["images"]["low_resolution"]["url"],
        standard_resolution: media["images"]["standard_resolution"]["url"]
      }
      images.push(image)
    end
    return images
  end

  def create_new_or_replace_old_images(images, instagram_auth)
    instagram_auth.instagram_images.create_or_update_each_by_id(images)
  end

end
