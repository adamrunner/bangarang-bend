class Admin::PageController < Admin::BaseController
  before_filter :find_page, only: [:edit, :update, :show]

  def index
    @pages = Page.all
    @instagram_auth = InstagramAuth.last
    @redirect_url = 'http://localhost:3000' if Rails.env.development?
    @redirect_url = 'https://bangarangbend.com' if Rails.env.production?
    @redirect_url = 'https://staging.bangarangbend.com' if Rails.env.staging?
  end

  def show
    @page_contents = @page.page_content
    @tab = params[:tab] || @page.default_tab
  end

  def update
    if @page.update(page_params)
      redirect_to admin_page_index_path, notice: "#{@page.link_name.titleize} Page Successfully Updated"
    end
  end

  private
  def page_params
    params.require(:page).permit(:link_name, :copy_text)
  end

  def find_page
    @page = Page.find(params[:id])
  end
end
