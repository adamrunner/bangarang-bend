class Admin::FeaturedItemController < Admin::BaseController
  before_filter :find_featured_item, only: [:edit, :update, :destroy]

  def create
    page = Page.find(params[:page_id])
    featured_item = page.featured_items.create(featured_item_params)
    if featured_item.save
      redirect_to admin_page_path(featured_item.page), notice: "Featured Item Successfully Created"
    end
  end

  def update
    @featured_item.update(featured_item_params)
    if @featured_item.save
      redirect_to admin_page_path(@featured_item.page), notice: "Featured Item Updated Successfully"
    end
  end

  def destroy
    if @featured_item.destroy
      redirect_to admin_page_path(@featured_item.page), alert: "Featured Item Deleted Successfully"
    end
  end

  private
  def featured_item_params
    params.require(:featured_item).permit(:name, :description, :img_url)
  end

  def find_featured_item
    @featured_item = FeaturedItem.find(params[:id])
  end
end
