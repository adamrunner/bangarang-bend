class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.references :catering_menu, index: true
      t.string :name
      t.timestamps null: false
    end
  end
end
