class InstagramAuthJob < Struct.new(:code, :uri) do
  require 'curb'
  SECRET = ENV['CLIENT_SECRET']

  def max_attempts
    1
  end

  def enqueue(job)
    Rails.cache.write('ig_auth_status', { msg: 'Initializing Authentication Process', percent: 25, type: "success" })
  end

  def perform
    Rails.cache.write('ig_auth_status', { msg: 'Waiting For Response', percent: 75, type: "success" })
    sleep(0.5)

    https = Curl.post "https://api.instagram.com/oauth/access_token", {
      client_id: "38c5b7d5d66d454e8d386b0a581074ba",
      client_secret: SECRET,
      grant_type: "authorization_code",
      redirect_uri: uri,
      code: code
    }
    result = JSON.parse(https.body_str)
    puts result

    case result['code']
    when 200
      create_or_update_access_token(result['access_token'])
    when 400
      handle_result_error(result)
    end
  end

  def before(job)
    Rails.cache.write('ig_auth_status', { msg: 'Sending Authentication Request', percent: 50, type: "success" })
    sleep(1)
  end

  # def success(job)
  # end

  def error(job, exception)
    puts exception
    Rails.cache.write('ig_auth_status', { msg: "Internal Server Error", percent: 75, type: "error" })
    sleep(1)
  end

  def after(job)
    sleep(1)
    Rails.cache.write('ig_auth_status', { msg: 'Success', percent: 100, type: "complete" })
  end

  # def failure(job)
  #
  # end

  private

  def create_or_update_access_token(token)
    auth = InstagramAuth.first
    if auth == nil
      auth = InstagramAuth.create(authorized: true, access_token: token)
    else
      auth.update(authorized: true, access_token: token)
    end
  end

  def handle_result_error(result)
    Rails.cache.write('ig_auth_status', { msg: result['error_message'], percent: 75, type: "error" })
    sleep(1)
  end

  end
end
