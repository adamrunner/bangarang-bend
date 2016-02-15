class Admin::MenuSectionController < Admin::BaseController

  def create
    catering_menu = CateringMenu.find(params[:catering_menu_id])
    menu_section = catering_menu.menu_sections.create(menu_section_params)
    if menu_section.save
      redirect_to admin_catering_menu_path(menu_section.catering_menu), notice: "Menu Section Successfully Created"
    end
  end

  def edit
    @menu_section = MenuSection.find(params[:id])
  end

  def update
    menu_section = MenuSection.find(params[:id])
    menu_section.update(menu_section_params)
    if menu_section.save
      redirect_to admin_catering_menu_path(menu_section.catering_menu), notice: "Menu Section Successfully Updated"
    end
  end

  def destroy
    menu_section = MenuSection.find(params[:id]).destroy
    if menu_section.destroy
      redirect_to admin_catering_menu_path(menu_section.catering_menu), alert: "Menu Section Deleted Successfully"
    end
  end

  private
  def menu_section_params
    params.require(:menu_section).permit(:name)
  end
end
