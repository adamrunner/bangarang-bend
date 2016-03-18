class Admin::CateringMenuController < Admin::BaseController
  before_filter :find_page, only: [:new, :create]
  before_filter :find_catering_menu, only: [:show, :edit, :update, :destroy]

  def create
    @catering_menu = @page.catering_menus.build(catering_menu_params)
    if @catering_menu.save
      redirect_to admin_catering_menu_path(@catering_menu), notice: "Catering Menu Successfully Created"
    end
  end

  def update
    @catering_menu.update(catering_menu_params)
    if @catering_menu.save
      redirect_to admin_catering_menu_path(@catering_menu), notice: "Catering Menu Successfully Updated"
    end
  end

  def destroy
    if @catering_menu.destroy
      redirect_to admin_page_path(@catering_menu.page), alert: "Catering Menu, all related Menu Sections and Menu Items Deleted Successfully"
    end
  end

  private
  def catering_menu_params
    params.require(:catering_menu).permit(:name, :description)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def find_catering_menu
    @catering_menu = CateringMenu.find(params[:id])
  end
end
