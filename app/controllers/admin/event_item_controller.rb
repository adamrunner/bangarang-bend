class Admin::EventItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_event_item, only: [:show, :edit, :update, :destroy]

  def create
    event_item = @page.event_items.create(event_item_params)
    if event_item.save
      redirect_to admin_page_path(event_item.page, tab: "event_items"), notice: "Month Successfully Created"
    end
  end

  def edit
    @current_produce = @event_item.event_produce_items
  end

  def update
    @event_item.update(event_item_params)
    if @event_item.save
      redirect_to edit_admin_event_item_path(@event_item), notice: "Month Successfully Updated"
    end
  end

  def destroy
    if @event_item.destroy
      redirect_to admin_page_path(@event_item.page, tab: "event_items"), alert: "Month Deleted Successfully"
    end
  end

  private
  def event_item_params
    params.require(:event_item).permit(:name, :description, event_produce_item_ids:[])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_event_item
    @event_item = EventItem.find(params[:id])
  end
end
