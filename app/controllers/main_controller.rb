class MainController < ApplicationController

  def index
    @page = Page.first
    @landing = @page.landings.first
    @featured_items = FeaturedItem.all
    @biography_items = BiographyItem.all
  end
end
