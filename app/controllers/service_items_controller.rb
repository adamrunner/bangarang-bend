class ServiceItemsController < ApplicationController

  def index
    @service_items = ServiceItem.all
  end
end
