class Admin::MenuSectionController < Admin::BaseController
  before_filter :find_catering_menu, only: [:new, :create]
  before_filter :find_menu_section, only: [:edit, :update, :destroy]

  def create
    menu_section = @catering_menu.menu_sections.create(menu_section_params)
    if menu_section.save
      redirect_to admin_catering_menu_path(menu_section.catering_menu), notice: "Menu Section Successfully Created"
    end
  end

  def update
    @menu_section.update(menu_section_params)
    if @menu_section.save
      redirect_to admin_catering_menu_path(@menu_section.catering_menu), notice: "Menu Section Successfully Updated"
    end
  end

  def destroy
    if @menu_section.destroy
      redirect_to admin_catering_menu_path(@menu_section.catering_menu), alert: "Menu Section Deleted Successfully"
    end
  end

  private
  def menu_section_params
    params.require(:menu_section).permit(:name)
  end

  def find_catering_menu
    @catering_menu = CateringMenu.find(params[:catering_menu_id])
  end

  def find_menu_section
    @menu_section = MenuSection.find(params[:id])
  end
end
