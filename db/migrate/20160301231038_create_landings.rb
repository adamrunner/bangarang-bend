class CreateLandings < ActiveRecord::Migration
  def change
    create_table :landings do |t|
      t.references :page, index: true
      t.string :heading
      t.string :image
      t.timestamps null: false
    end
  end
end
