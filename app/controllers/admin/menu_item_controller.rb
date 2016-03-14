class Admin::MenuItemController < Admin::BaseController
  before_filter :find_menu_section, only: [:create, :new]
  before_filter :find_menu_item, only: [:edit, :update, :destroy]

  def create
    menu_item = @menu_section.menu_items.build(menu_item_params)
    if menu_item.save
      redirect_to admin_catering_menu_path(menu_item.catering_menu), notice: "Menu Item Successfully Created"
    end
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to admin_catering_menu_path(@menu_item.catering_menu), notice: "Menu Item Successfully Updated"
    end
  end

  def destroy
    if @menu_item.destroy
      redirect_to admin_catering_menu_path(@menu_item.catering_menu), alert: "Menu Item Deleted Successfully"
    end
  end

  private
  def menu_item_params
    params.require(:menu_item).permit(:name, :choices, :price, :special_attr)
  end

  def find_menu_section
    @menu_section = MenuSection.find(params[:menu_section_id])
  end

  def find_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
