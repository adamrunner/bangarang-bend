class MainController < ApplicationController

  def index
    @featured_items = FeaturedItem.all
    @biography_items = BiographyItem.all
  end
end
