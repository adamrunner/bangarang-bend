class AddServicesData < ActiveRecord::Migration
  def service_items
    service_items = [
      { name: "pick up or drop off",
        description: "Stop by at your convenience or let us deliver, assemble, and clean up your buffet when your event is finished"},
      { name: "buffet",
        description: "We will assemble and staff your buffet keeping it looking fresh until you event is over"},
      { name: "family style",
        description: "Let our servers deliver your spread to your guest tables in a family style dining format"},
      { name: "butlered",
        description: "We will hand pass any number of your hor dourves throughout your party as your guests mingle"},
      { name: "plated service",
        description: "This is our premiere restaurant style service where we will serve each one of your guests’ entrees at their table"}
    ]
  end

  def up
    services = Page.find_by(name: "services")

    service_items.each do |service_item|
      services.service_items.create(service_item)
    end
  end

  def down
    ServiceItem.all.each do |service_item|
      service_item.destroy
    end
  end

end
