class Admin::PageController < Admin::BaseController

  def index
    @admin_users = AdminUser.all
    @pages = Page.all
    @breadcrumbs = PageCrumbs.index
  end

  def show
    @pages = Page.all
    @page = Page.find(params[:id])
    @content_items = @page.page_content
    @breadcrumbs = PageCrumbs.show(@page)
  end

  private
  def page_params
    params.require(:page).permit(:name)
  end
end
