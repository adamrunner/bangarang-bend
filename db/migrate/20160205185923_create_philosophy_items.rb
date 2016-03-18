class CreatePhilosophyItems < ActiveRecord::Migration
  def change
    create_table :philosophy_items do |t|
      t.references :page, index: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
