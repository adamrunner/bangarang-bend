class AddBiographyData < ActiveRecord::Migration
  def biography_items
    biography_items = [
      { 
        name: "Chef Dave Bodi",
        description: "Chef Dave Bodi is a 4.0 graduate of Le Cordon Bleu, Portland, OR, was the owner/operator of Black Dog Baking Co. and went on to be the Executive Chef for Oregon Bride Magazine’s 2015 Caterer of the Year , statewide. He has customized hundreds of menus in all different styles and cultures of cooking and enjoys taking part in charitable community actions.",
        img_url: "/images/headshot_02.jpg"
      },{
        name: "Amy Bodi",
        description: "Amy Bodi is a graduate from Oregon State University with a degree in Merchandising and Interior Design. With over fifteen years in customer service, building and maintaining relationships is at the forefront of every interaction. Event coordination from logistics to décor is available with any booking.",
        img_url: "/images/headshot_01.jpg"
      }
    ]
  end

  def up
    home = Page.find_by(name: "home")

    biography_items.each do |biography_item|
      home.biography_items.create(biography_item)
    end
  end

  def down
    BiographyItem.all.each do |biography_item|
      biography_item.destroy
    end
  end
end
