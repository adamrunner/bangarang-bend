class Admin::FoodTruckAddressesController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_food_truck_address, only: [:show, :edit, :update, :destroy, :set_active]
  before_filter :check_length, only: [:destroy]

  def create
    if @page.food_truck_addresses.create(food_truck_address_params)
      redirect_to admin_page_path(@page, tab: "food_truck_address"), notice: "Food Truck Address Successfully Created"
    end
  end

  def update
    if @food_truck_address.update(food_truck_address_params)
      redirect_to admin_page_path(@food_truck_address.page, tab: "food_truck_address"), notice: "Food Truck Address Successfully Updated"
    end
  end

  def destroy
    if @food_truck_address.destroy
      redirect_to admin_page_path(@food_truck_address.page, tab: "food_truck_address"), alert: "Address Link Deleted Successfully"
    end
  end

  def set_active
    @food_truck_address.active = true
    if @food_truck_address.save
      redirect_to admin_page_path(@food_truck_address.page, tab: "food_truck_address"), notice: "Address Link Successfully Activated"
    end
  end

  private

  def food_truck_address_params
    params.require(:food_truck_address).permit(:link_url, :description, :active)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_food_truck_address
    @food_truck_address = FoodTruckAddress.find(params[:id])
  end

  def check_length
    if FoodTruckAddress.all.length == 1
      redirect_to admin_page_path(@food_truck_address.page, tab: "food_truck_address"), alert: "Cannot delete address link if only one exists"
    end
  end
end
