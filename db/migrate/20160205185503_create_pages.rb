class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :link_name
      t.text :description, default: nil
      t.timestamps null: false
    end
  end
end
