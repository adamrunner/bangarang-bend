class Admin::FeaturedItemController < Admin::BaseController


  def new
    #TODO add in option for image uploads
  end

  def create
    page = Page.find(params[:page_id])
    featured_item = page.featured_items.create(featured_item_params)
    if featured_item.save
      redirect_to admin_page_path(featured_item.page), notice: "Featured Item Successfully Created"
    end
  end

  def edit
    @featured_item = FeaturedItem.find(params[:id])
  end

  def update
    featured_item = FeaturedItem.find(params[:id])
    featured_item.update(featured_item_params)
    if featured_item.save
      redirect_to admin_page_path(featured_item.page), notice: "Featured Item Updated Successfully"
    end
  end

  def destroy
    featured_item = FeaturedItem.find(params[:id]).destroy
    if featured_item.destroy
      redirect_to admin_page_path(featured_item.page), alert: "Featured Item Deleted Successfully"
    end
  end

  private
  def featured_item_params
    params.require(:featured_item).permit(:name, :description, :img_url)
  end
end
