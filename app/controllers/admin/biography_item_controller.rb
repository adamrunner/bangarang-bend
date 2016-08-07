class Admin::BiographyItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_biography_item, only: [:edit, :update, :destroy, :destroy_img]

  def create
    if @page.biography_items.create(biography_item_params)
      redirect_to admin_page_path(@page, tab: "biography_items"), notice: "Biography Successfully Created"
    end
  end

  def update
    if @biography_item.update(biography_item_params)
      redirect_to admin_page_path(@biography_item.page, tab: "biography_items"), notice: "Biography Item Updated Successfully"
    end
  end

  def destroy
    if @biography_item.destroy
      redirect_to admin_page_path(@biography_item.page, tab: "biography_items"), alert: "Biography Item Deleted Successfully"
    end
  end

  def destroy_img
    @biography_item.remove_image!
    if @biography_item.save
      redirect_to edit_admin_biography_item_path(@biography_item), alert: "Image Deleted Successfully"
    end
  end

  private
  def biography_item_params
    params.require(:biography_item).permit(:name, :description, :image, :remove_image)
  end

  def find_biography_item
    @biography_item = BiographyItem.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
