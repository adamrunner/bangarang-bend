class MainController < ApplicationController

  def index
    @pages              = Page.all
    @page               = @pages.find_by(name: "home")
    @landing            = @page.landings.first
    @food_truck_address = FoodTruckAddress.first
    @featured_items     = FeaturedItem.all
    @biography_items    = BiographyItem.all
    @menus              = CateringMenu.all
    @service_items      = ServiceItem.all
    @event_items        = EventItem.all
    @philosophy_items   = PhilosophyItem.all
  end
end
