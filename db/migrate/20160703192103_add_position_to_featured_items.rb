class AddPositionToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :featured_items, :position, :integer;
  end
end
