class CreateServiceItems < ActiveRecord::Migration
  def change
    create_table :service_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
