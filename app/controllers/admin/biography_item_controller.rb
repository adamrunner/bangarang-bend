class Admin::BiographyItemController < Admin::BaseController

  def new
    #TODO add in option for image uploads
  end

  def create
    page = Page.find(params[:page_id])
    biography_item = page.biography_items.create(biography_item_params)
    if biography_item.save
      redirect_to admin_page_path(biography_item.page), notice: "Biography Successfully Created"
    end
  end

  def edit
    @biography_item = BiographyItem.find(params[:id])
  end

  def update
    biography_item = BiographyItem.find(params[:id])
    biography_item.update(biography_item_params)
    if biography_item.save
      redirect_to admin_page_path(biography_item.page), notice: "Biography Item Updated Successfully"
    end
  end

  def destroy
    biography_item = BiographyItem.find(params[:id]).destroy
    if biography_item.destroy
      redirect_to admin_page_path(biography_item.page), alert: "Biography Item Deleted Successfully"
    end
  end

  private
  def biography_item_params
    params.require(:biography_item).permit(:name, :description, :img_url)
  end
end
