class AddFoodTruckPage < ActiveRecord::Migration
  page = Page.new(name:"food_truck", link_name: "food truck")
  page.save
end
