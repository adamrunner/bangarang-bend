class EventItemsController < ApplicationController

  def index
    @event_items = EventItem.all
  end
end
