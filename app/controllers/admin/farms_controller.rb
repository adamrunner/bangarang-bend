class Admin::FarmsController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_farm, only: [:edit, :update, :destroy, :destroy_img]

  def create
    if @page.farms.create(farm_params)
      redirect_to admin_page_path(@page), notice: "Farm Successfully Created"
    end
  end

  def update
    if @farm.update(farm_params)
      redirect_to admin_page_path(@farm.page), notice: "Farm Updated Successfully"
    end
  end

  def destroy
    if @farm.destroy
      redirect_to admin_page_path(@farm.page), alert: "Farm Deleted Successfully"
    end
  end

  def destroy_img
    @farm.remove_farm_image!
    if @farm.save
      redirect_to edit_admin_farm_path(@farm), alert: "Image Deleted Successfully"
    end
  end

  private
  def farm_params
    params.require(:farm).permit(:name, :description, :url, :farm_image, :remove_farm_image)
  end

  def find_farm
    @farm = Farm.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

end
