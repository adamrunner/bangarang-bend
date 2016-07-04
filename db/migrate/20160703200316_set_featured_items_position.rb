class SetFeaturedItemsPosition < ActiveRecord::Migration
  featured = FeaturedItem.all
  featured.each_with_index do |item, index|
    item.position = index + 1
    item.save
  end
end
