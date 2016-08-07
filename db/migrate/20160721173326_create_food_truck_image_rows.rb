class CreateFoodTruckImageRows < ActiveRecord::Migration
  def change
    create_table :food_truck_image_rows do |t|
      t.references :page, index: true
      t.string :small_image
      t.string :large_image
      t.timestamps null: false
    end
  end
end
