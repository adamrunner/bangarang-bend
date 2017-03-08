class AddLinkTitleToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :featured_items, :link_title, :string;
  end
end
