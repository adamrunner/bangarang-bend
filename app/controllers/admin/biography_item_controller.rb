class Admin::BiographyItemController < Admin::BaseController
  before_filter :find_biography_item, only: [:edit, :update, :destroy ]

  def create
    page = Page.find(params[:page_id])
    biography_item = page.biography_items.create(biography_item_params)
    if biography_item.save
      redirect_to admin_page_path(biography_item.page), notice: "Biography Successfully Created"
    end
  end

  def update
    @biography_item.update(biography_item_params)
    if @biography_item.save
      redirect_to admin_page_path(@biography_item.page), notice: "Biography Item Updated Successfully"
    end
  end

  def destroy
    if @biography_item.destroy
      redirect_to admin_page_path(@biography_item.page), alert: "Biography Item Deleted Successfully"
    end
  end

  private
  def biography_item_params
    params.require(:biography_item).permit(:name, :description, :img_url)
  end

  def find_biography_item
    @biography_item = BiographyItem.find(params[:id])
  end
end
