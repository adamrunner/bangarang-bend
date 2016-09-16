class DeleteEvents < ActiveRecord::Migration
  def up
    drop_table :event_items_produce_items
    drop_table :event_items
    drop_table :event_produce_items
    Page.find_by(name: "events").destroy
  end

  def down
    create_table :event_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
    create_table :event_produce_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
    create_table :event_items_produce_items, id: false do |t|
      t.belongs_to :event_item, index: true
      t.belongs_to :event_produce_item, index: true
    end
    Page.create(name: "events", content: ["event_items", "event_produce_items"])
  end
end
