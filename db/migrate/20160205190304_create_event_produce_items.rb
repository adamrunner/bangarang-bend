class CreateEventProduceItems < ActiveRecord::Migration
  def change
    create_table :event_produce_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
