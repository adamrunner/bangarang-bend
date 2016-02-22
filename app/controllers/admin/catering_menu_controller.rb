class Admin::CateringMenuController < Admin::BaseController

  def new
    @page = Page.find(params[:page_id])
  end

  def create
    page = Page.find(params[:page_id])
    catering_menu = page.catering_menus.create(catering_menu_params)
    if catering_menu.save
      redirect_to admin_catering_menu_path(catering_menu), notice: "Catering Menu Successfully Created"
    end
  end

  def show
    @catering_menu = CateringMenu.find(params[:id])
  end

  def edit
    @catering_menu = CateringMenu.find(params[:id])
  end

  def update
    catering_menu = CateringMenu.find(params[:id])
    catering_menu.update(catering_menu_params)
    if catering_menu.save
      redirect_to admin_catering_menu_path(catering_menu), notice: "Catering Menu Successfully Updated"
    end
  end

  def destroy
    catering_menu = CateringMenu.find(params[:id]).destroy
    if catering_menu.destroy
      redirect_to admin_page_path(catering_menu.page), alert: "Catering Menu, all related Menu Sections and Menu Items Deleted Successfully"
    end
  end

  private
  def catering_menu_params
    params.require(:catering_menu).permit(:name, :description)
  end
end
