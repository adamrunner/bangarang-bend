class Admin::BiographyItemController < Admin::BaseController

  def index
    biography_items = BiographyItem.all
  end
end
