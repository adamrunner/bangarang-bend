class AddOptionsToFoodTruckAddress < ActiveRecord::Migration
  def change
    add_column :food_truck_addresses, :options, :text
  end
end
