class MainController < ApplicationController

  def index
    @pages                 = Page.all
    @page                  = @pages.find_by(name: "home")
    @landing               = @page.landings.first
    @food_truck_address    = FoodTruckAddress.find_by(active: true)
    @food_truck_image_rows = FoodTruckImageRow.all
    @featured_items        = FeaturedItem.order(:position)
    @biography_items       = BiographyItem.all
    @menus                 = CateringMenu.all
    @service_items         = ServiceItem.all
    @philosophy_items      = PhilosophyItem.all
    @farms                 = Farm.all

    instagram_auth = InstagramAuth.first

    if instagram_auth
      @instagram_images = instagram_auth.instagram_images
    else
      @instagram_images = nil
    end
  end
end
