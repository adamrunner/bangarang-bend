class Admin::EventItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_event_item, only: [:show, :edit, :update, :destroy]

  def create
    event_item = @page.event_items.create(event_item_params)
    if event_item.save
      redirect_to admin_page_path(event_item.page), notice: "Event Item Successfully Created"
    end
  end

  def edit
    @current_produce = @event_item.event_produce_items
    @all_produce = EventProduceItem.all
    @difference_produce = @all_produce - @current_produce
  end

  def update
    @event_item.update(event_item_params)
    if @event_item.save
      redirect_to edit_admin_event_item_path(@event_item), notice: "Event Item Successfully Updated"
    end
  end

  def destroy
    if @event_item.destroy
      redirect_to admin_page_path(@event_item.page), alert: "Event Item Deleted Successfully"
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
