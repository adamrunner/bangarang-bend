class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.belongs_to :menu_section, index: true
      t.string  :name
      t.text    :choices
      t.string :price
      t.string :special_attr, default: nil
      t.timestamps null: false
    end
  end
end
