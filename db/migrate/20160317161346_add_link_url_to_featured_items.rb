class AddLinkUrlToFeaturedItems < ActiveRecord::Migration
  def change
    add_column :featured_items, :link_url, :string;
  end
end
