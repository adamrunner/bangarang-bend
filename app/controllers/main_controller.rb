class MainController < ApplicationController

  def index
    @page = Page.first
    @landing = @page.landings.first
    @featured_items = FeaturedItem.all
    @biography_items = BiographyItem.all
    @menus = CateringMenu.all
    @service_items = ServiceItem.all
    @event_items = EventItem.all
    @philosophy_items = PhilosophyItem.all
  end
end
