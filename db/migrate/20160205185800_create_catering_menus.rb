class CreateCateringMenus < ActiveRecord::Migration
  def change
    create_table :catering_menus do |t|
      t.references :page, index: true
      t.string :name
      t.text :description, default: nil
      t.timestamps null: false
    end
  end
end
