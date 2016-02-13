class CreateEventProduceItems < ActiveRecord::Migration
  def change
    create_table :event_produce_items do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
