class Admin::EventProduceItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_event_produce_item, only: [:show, :edit, :update, :destroy]

  def create
    event_produce_item = @page.event_produce_items.create(event_produce_item_params)
    if event_produce_item.save
      redirect_to admin_page_path(event_produce_item.page, tab: "event_produce_items"), notice: "Event Produce Item Successfully Created"
    end
  end

  def update
    @event_produce_item.update(event_produce_item_params)
    if @event_produce_item.save
      redirect_to edit_admin_event_produce_item_path(@event_produce_item, tab: "event_produce_items"), notice: "Event Produce Item Successfully Updated"
    end
  end

  def destroy
    if @event_produce_item.destroy
      redirect_to admin_page_path(@event_produce_item.page, tab: "event_produce_items"), alert: "Event Produce Item Deleted Successfully"
    end
  end

  private
  def event_produce_item_params
    params.require(:event_produce_item).permit(:name, :description, event_item_ids:[])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_event_produce_item
    @event_produce_item = EventProduceItem.find(params[:id])
  end
end
