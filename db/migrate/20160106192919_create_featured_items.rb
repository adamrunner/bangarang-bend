class CreateFeaturedItems < ActiveRecord::Migration
  def change
    create_table :featured_items do |t|
      t.references :page, index: true
      t.string  :name
      t.text    :description
      t.string :image_url
      t.timestamps null: false
    end
  end
end
