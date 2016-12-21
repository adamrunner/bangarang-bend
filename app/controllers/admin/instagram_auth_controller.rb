class Admin::InstagramAuthController < Admin::BaseController

  def create
    code = instagram_auth_params[:code]
    render status: 200, json: { data: "Code Received" }

    redirect_url = new_admin_instagram_auth_url
    Delayed::Job.enqueue(Admin::InstagramAuthController::InstagramAuthJob.new(code, redirect_url))
    Delayed::Job.enqueue(Admin::InstagramAuthController::InstagramDataJob.new)
  end

  def auth_status
    @status = Rails.cache.read('ig_auth_status')
    render status: 200, json: @status
  end

  def destroy
    instagram_auth = InstagramAuth.find_by_id(params[:id])
    if instagram_auth.destroy
      redirect_to admin_root_path, alert: "Un-Authorized Your Instagram Account Successfully"
    end
  end

  private

  def instagram_auth_params
    params.require(:instagram_auth).permit(:code)
  end

end
