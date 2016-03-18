class AddImageToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :featured_items, :image, :string
  end
end
