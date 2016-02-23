class Admin::EventItemController < Admin::BaseController

  def new
    @page = Page.find(params[:page_id])
  end

  def create
    page = Page.find(params[:page_id])
    event_item = page.event_items.create(event_item_params)
    if event_item.save
      redirect_to admin_page_path(event_item.page), notice: "Event Item Successfully Created"
    end
  end

  def show
    @event_item = EventItem.find(params[:id])
  end

  def edit
    @event_item = EventItem.find(params[:id])
  end

  def update
    event_item = EventItem.find(params[:id])
    event_item.update(event_item_params)
    if event_item.save
      redirect_to admin_page_path(event_item.page), notice: "Event Item Successfully Updated"
    end
  end

  def destroy
    event_item = EventItem.find(params[:id]).destroy
    if event_item.destroy
      redirect_to admin_page_path(event_item.page), alert: "Event Item Deleted Successfully"
    end
  end

  private
  def event_item_params
    params.require(:event_item).permit(:name, :description)
  end
end
