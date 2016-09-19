class CreateFarms < ActiveRecord::Migration
  def up
    create_table :farms do |t|
      t.references :page, index: true
      t.string :name
      t.string :url
      t.text :description
      t.string :farm_image
      t.timestamps null: false
    end

    Page.create(
      name: "the_farms",
      link_name: "The Farms",
      copy_text: "We utilize a handful of exceptional farms who are passionate about their organic, sustainable practices and who have committed their lives to setting farm practices right. These farms grow and raise what makes sense for the health of the earth that gives back year after year. We take what they yield and give it continued respect through our culinary techniques. Because of this our menus are constantly adapting to what the land has given us.",
      show_copy_text: true,
      content: ["farms"]
    )
  end

  def down
    drop_table :farms
    Page.find_by(name: "the_farms").destroy
  end

end
