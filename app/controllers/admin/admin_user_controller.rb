class Admin::AdminUserController < Admin::BaseController

  def index
    @admin_users = AdminUser.all
    @pages = Page.all
  end
end
