class Admin::FoodTruckImageRowsController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_food_truck_image_row, only: [:edit, :update, :destroy, :destroy_img]

  def create
    if @page.food_truck_image_rows.create(food_truck_image_row_params)
      redirect_to admin_page_path(@page, tab: 'food_truck_image_rows'), notice: "Food Truck Images Successfully Uploaded"
    end
  end

  def update
    if @food_truck_image_row.update(food_truck_image_row_params)
      redirect_to admin_page_path(@food_truck_image_row.page, tab: 'food_truck_image_rows'), notice: "Food Truck Images Updated Successfully"
    end
  end

  def destroy_img
    @food_truck_image_row.remove_image!
    if @food_truck_image_row.save
      redirect_to edit_admin_food_truck_image_row_path(@food_truck_image_row), alert: "Image Deleted Successfully"
    end
  end

  def destroy
    if @food_truck_image_row.destroy
      redirect_to admin_page_path(@food_truck_image_row.page, tab: 'food_truck_image_rows'), alert: "Food Truck Image Row Deleted Successfully"
    end
  end

  private
  def food_truck_image_row_params
    params.require(:food_truck_image_row).permit(:small_image, :remove_small_image, :large_image, :remove_large_image)
  end

  def find_food_truck_image_row
    @food_truck_image_row = FoodTruckImageRow.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
