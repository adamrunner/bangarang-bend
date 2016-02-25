class AddImageToBiographyItems < ActiveRecord::Migration
  def change
    add_column :biography_items, :image, :string
  end
end
