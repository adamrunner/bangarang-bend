class Admin::FeaturedItemController < Admin::BaseController

  def index
    @featured_items = FeaturedItem.all
  end
end
