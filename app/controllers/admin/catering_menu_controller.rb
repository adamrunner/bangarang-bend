class Admin::CateringMenuController < Admin::BaseController
  def show
    @catering_menu = CateringMenu.find(params[:id])
  end

  private
  def catering_menu_params
    params.require(:catering_menu).permit(:name)
  end
end
