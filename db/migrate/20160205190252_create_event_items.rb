class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
    create_table :event_items_produce_items, id: false do |t|
      t.belongs_to :event_item, index: true
      t.belongs_to :event_produce_item, index: true
    end
  end
end
