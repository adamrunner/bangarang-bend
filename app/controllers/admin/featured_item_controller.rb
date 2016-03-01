class Admin::FeaturedItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_featured_item, only: [:edit, :update, :destroy, :destroy_img]

  def create
    featured_item = @page.featured_items.build(featured_item_params)
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

  def destroy_img
    @featured_item.remove_image!
    if @featured_item.save
      redirect_to edit_admin_featured_item_path(@featured_item), alert: "Image Deleted Successfully"
    end
  end

  def destroy
    if @featured_item.destroy
      redirect_to admin_page_path(@featured_item.page), alert: "Featured Item Deleted Successfully"
    end
  end

  private
  def featured_item_params
    params.require(:featured_item).permit(:name, :description, :image, :remove_image)
  end

  def find_featured_item
    @featured_item = FeaturedItem.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
