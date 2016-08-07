class CreateFoodTruckAddresses < ActiveRecord::Migration
  def change
    create_table :food_truck_addresses do |t|
      t.references :page, index: true
      t.string :description
      t.string :link_url
      t.timestamps null: false
    end
  end
end
