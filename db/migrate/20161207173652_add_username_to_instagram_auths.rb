class AddUsernameToInstagramAuths < ActiveRecord::Migration
  add_column :instagram_auths, :username, :string;
end
