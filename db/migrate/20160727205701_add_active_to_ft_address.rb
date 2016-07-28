class AddActiveToFtAddress < ActiveRecord::Migration
  def change
    add_column :food_truck_addresses, :active, :boolean, default: false
  end
end
