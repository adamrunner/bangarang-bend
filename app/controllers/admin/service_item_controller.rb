class Admin::ServiceItemController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_service_item, only: [:show, :edit, :update, :destroy]

  def create
    service_item = @page.service_items.create(service_item_params)
    if service_item.save
      redirect_to admin_page_path(service_item.page), notice: "Service Item Successfully Created"
    end
  end

  def update
    @service_item.update(service_item_params)
    if @service_item.save
      redirect_to admin_page_path(@service_item.page), notice: "Service Item Successfully Updated"
    end
  end

  def destroy
    if @service_item.destroy
      redirect_to admin_page_path(@service_item.page), alert: "Service Item Deleted Successfully"
    end
  end

  private
  def service_item_params
    params.require(:service_item).permit(:name, :description)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_service_item
    @service_item = ServiceItem.find(params[:id])
  end
end
