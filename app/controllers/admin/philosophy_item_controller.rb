class Admin::PhilosophyItemController < Admin::BaseController

  def new
    @page = Page.find(params[:page_id])
  end

  def create
    page = Page.find(params[:page_id])
    philosophy_item = page.philosophy_items.create(philosophy_item_params)
    if philosophy_item.save
      redirect_to admin_page_path(philosophy_item.page), notice: "Philosophy Item Successfully Created"
    end
  end

  def show
    @philosophy_item = PhilosophyItem.find(params[:id])
  end

  def edit
    @philosophy_item = PhilosophyItem.find(params[:id])
  end

  def update
    philosophy_item = PhilosophyItem.find(params[:id])
    philosophy_item.update(philosophy_item_params)
    if philosophy_item.save
      redirect_to admin_page_path(philosophy_item.page), notice: "Philosophy Item Successfully Updated"
    end
  end

  def destroy
    philosophy_item = PhilosophyItem.find(params[:id]).destroy
    if philosophy_item.destroy
      redirect_to admin_page_path(philosophy_item.page), alert: "Philosophy Item Deleted Successfully"
    end
  end

  private
  def philosophy_item_params
    params.require(:philosophy_item).permit(:name, :description)
  end
end
