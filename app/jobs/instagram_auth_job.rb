class InstagramAuthJob < Struct.new(:code, :uri) do
  require 'curb'
  # the secret of our Instagram Developer client, https://www.instagram.com/developer/clients/manage/
  # used for secure authorization
  SECRET = ENV['CLIENT_SECRET']

  # NOTE this job talks to the Instagram API
  # for more information on expected requests & responses check out
  # https://www.instagram.com/developer/authentication/

  def max_attempts
    # don't try this job again if it fails. We'll let the client side trigger it again manually
    1
  end

  def enqueue(job)
    # called when job is queued
    # store progress of authentication in cache so JS polling from client side can access this data in InstagramAuthController#auth_status
    Rails.cache.write('ig_auth_status', { msg: 'Initializing Authentication Process', percent: 25, type: "success" })
  end

  def perform
    # store progress of authentication in cache so JS polling from client side can access this data in InstagramAuthController#auth_status
    Rails.cache.write('ig_auth_status', { msg: 'Waiting For Response', percent: 75, type: "success" })
    # pause to allow time for updating client side of auth status
    sleep(0.5)

    # make request to Instagram API and JSON.parse response
    https = Curl.post "https://api.instagram.com/oauth/access_token", {
      client_id: "38c5b7d5d66d454e8d386b0a581074ba",
      client_secret: SECRET,
      grant_type: "authorization_code",
      redirect_uri: uri,
      code: code
    }
    result = JSON.parse(https.body_str)

    if result['access_token']
      # if respons contains access token, update instagram_auth, or create if it doesn't exist
      create_or_update_access_token(result)
    else
      # if no access_token reponse will contain an error
      handle_result_error(result)
    end
  end

  def before(job)
    # called before perform
    # store progress of authentication in cache so JS polling from client side can access this data in InstagramAuthController#auth_status
    Rails.cache.write('ig_auth_status', { msg: 'Sending Authentication Request', percent: 50, type: "success" })
    # pause to allow time for updating client side of auth status
    sleep(1)
  end

  def error(job, exception)
    # called if something causes job to break
    puts exception
    # store progress of authentication in cache so JS polling from client side can access this data in InstagramAuthController#auth_status
    Rails.cache.write('ig_auth_status', { msg: "Internal Server Error", percent: 75, type: "error" })
    # pause to allow time for updating client side of auth status
    sleep(1)
  end

  def after(job)
    # called after perform
    # pause to allow time for updating client side of auth status
    sleep(1)
    # store progress of authentication in cache so JS polling from client side can access this data in InstagramAuthController#auth_status
    Rails.cache.write('ig_auth_status', { msg: 'Success', percent: 100, type: "complete" })
  end

  private

  def create_or_update_access_token(result)
    attributes = {
      authorized: true,
      access_token: result['access_token'],
      username: result['user']['username']
    }
    InstagramAuth.create_or_update(attributes)
  end

  def handle_result_error(result)
    Rails.cache.write('ig_auth_status', { msg: result['error_message'], percent: 75, type: "error" })
    sleep(1)
  end

  end
end
