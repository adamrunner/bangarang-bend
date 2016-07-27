class Admin::LandingController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_landing, only: [:edit, :update, :destroy, :destroy_img]

  def create
    landing = @page.landings.new()
    landing.heading = "<span>#{landing_params[:first_line]}</span> <br> <span>#{landing_params[:second_line]}</span>"
    landing.image = landing_params[:image]
    if landing.save
      redirect_to admin_page_path(landing.page, tab: "landings"), notice: "Landing Created Successfully"
    end
  end

  def edit
    split = @landing.heading.split(" <br> ")
    @line_1 = split[0]
    @line_2 = split[1]
  end

  def update
    @landing.heading = "#{landing_params[:first_line]} <br> #{landing_params[:second_line]}"
    @landing.image = landing_params[:image]
    if @landing.save
      redirect_to admin_page_path(@landing.page, tab: "landings"), notice: "Landing Updated Successfully"
    end
  end

  def destroy_img
    @landing.remove_image!
    if @landing.save
      redirect_to edit_admin_landing_path(@landing), alert: "Image Deleted Successfully"
    end
  end

  def destroy
    if @landing.destroy
      redirect_to admin_page_path(@landing.page, tab: "landings"), alert: "Landing Deleted Successfully"
    end
  end

  private
  def landing_params
    params.require(:landing).permit(:first_line, :second_line, :image, :remove_image)
  end

  def find_landing
    @landing = Landing.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end
end
