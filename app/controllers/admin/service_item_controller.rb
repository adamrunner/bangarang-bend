class Admin::ServiceItemController < Admin::BaseController

  def new
    @page = Page.find(params[:page_id])
  end

  def create
    page = Page.find(params[:page_id])
    service_item = page.service_items.create(service_item_params)
    if service_item.save
      redirect_to admin_page_path(service_item.page), notice: "Service Item Successfully Created"
    end
  end

  def show
    @service_item = ServiceItem.find(params[:id])
  end

  def edit
    @service_item = ServiceItem.find(params[:id])
  end

  def update
    service_item = ServiceItem.find(params[:id])
    service_item.update(service_item_params)
    if service_item.save
      redirect_to admin_page_path(service_item.page), notice: "Service Item Successfully Updated"
    end
  end

  def destroy
    service_item = ServiceItem.find(params[:id]).destroy
    if service_item.destroy
      redirect_to admin_page_path(service_item.page), alert: "Service Item Deleted Successfully"
    end
  end

  private
  def service_item_params
    params.require(:service_item).permit(:name, :description)
  end
end
