class CateringMenusController < ApplicationController

  def index
    @catering_menus = CateringMenu.all
  end

  def show
    @catering_menu = CateringMenu.find(params[:id])
  end
end
