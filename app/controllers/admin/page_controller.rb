class Admin::PageController < Admin::BaseController

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @page_contents = @page.page_content
    @tab = params[:tab] || "featured"
  end

  private
  def page_params
    params.require(:page).permit(:name)
  end
end
