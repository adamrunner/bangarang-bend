class Admin::PageController < Admin::BaseController
  def show
    @pages = Page.all
    @page = Page.find(params[:id])
    @content_items = @page.page_content
  end

  private
  def page_params
    params.require(:page).permit(:name)
  end
end
