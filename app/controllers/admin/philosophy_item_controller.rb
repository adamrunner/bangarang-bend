class Admin::PhilosophyItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_philosophy_item, only: [:show, :edit, :update, :destroy]

  def create
    philosophy_item = @page.philosophy_items.create(philosophy_item_params)
    if philosophy_item.save
      redirect_to admin_page_path(philosophy_item.page), notice: "Philosophy Item Successfully Created"
    end
  end

  def update
    @philosophy_item.update(philosophy_item_params)
    if @philosophy_item.save
      redirect_to admin_page_path(@philosophy_item.page), notice: "Philosophy Item Successfully Updated"
    end
  end

  def destroy
    if @philosophy_item.destroy
      redirect_to admin_page_path(@philosophy_item.page), alert: "Philosophy Item Deleted Successfully"
    end
  end

  private
  def philosophy_item_params
    params.require(:philosophy_item).permit(:name, :description)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_philosophy_item
    @philosophy_item = PhilosophyItem.find(params[:id])
  end
end
