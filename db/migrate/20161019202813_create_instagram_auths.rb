class CreateInstagramAuths < ActiveRecord::Migration
  def change
    create_table :instagram_auths do |t|
      t.boolean :authorized
      t.string :access_token
      t.timestamps null: false
    end
  end
end
