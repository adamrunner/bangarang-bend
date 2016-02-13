class Admin::MenuItemController < Admin::BaseController

  def create
    menu_section = MenuSection.find(params[:menu_section_id])
    menu_item = menu_section.menu_items.create(menu_item_params)
    if menu_item.save
      redirect_to admin_catering_menu_path(menu_item.catering_menu), notice: "Menu Item Successfully Created"
    end
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @menu_item.update(menu_item_params)
    if @menu_item.save
      redirect_to admin_catering_menu_path(@menu_item.catering_menu), notice: "Menu Item Successfully Updated"
    end
  end

  def destroy
    menu_item = MenuItem.find(params[:id]).destroy
    if menu_item.destroy
      redirect_to admin_catering_menu_path(menu_item.catering_menu), alert: "Menu Item Deleted Successfully"
    end
  end

  private
  def menu_item_params
    params.require(:menu_item).permit(:name, :choices, :price, :special_attr)
  end
end
