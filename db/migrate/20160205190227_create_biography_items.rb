class CreateBiographyItems < ActiveRecord::Migration
  def change
    create_table :biography_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.string :img_url
      t.timestamps null: false
    end
  end
end
