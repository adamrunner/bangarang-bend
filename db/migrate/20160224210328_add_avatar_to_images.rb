class AddAvatarToImages < ActiveRecord::Migration
  def change
    add_column :images, :avatar, :string
  end
end
