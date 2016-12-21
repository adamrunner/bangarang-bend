class CreateInstagramImages < ActiveRecord::Migration
  def change
    create_table :instagram_images do |t|
      t.references :instagram_auth, index: true
      t.string :thumbnail
      t.string :low_resolution
      t.string :standard_resolution
      t.timestamps null: false
    end
  end
end
