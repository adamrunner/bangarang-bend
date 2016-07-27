class Admin::FoodTruckAddressController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_food_truck_address, only: [:show, :edit, :update, :destroy]

  def update
    @food_truck_address.update(food_truck_address_params)
    if @food_truck_address.save
      redirect_to admin_page_path(@food_truck_address.page), notice: "Food Truck Address Successfully Updated"
    end
  end

  private

  def food_truck_address_params
    params.require(:food_truck_address).permit(:link_url, :description)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_food_truck_address
    @food_truck_address = FoodTruckAddress.find(params[:id])
  end
end
