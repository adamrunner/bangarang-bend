class AddFeaturedItemData < ActiveRecord::Migration
  def featured_items
    featured_items = [
      { name: "Brides and Grooms­-To-­Be",
        description: "Book your catering with us by March 15th and we will waive ALL gratuities! Call to set up your tasting."},
      { name: "Oregon Black Truffles in season",
        description: "We are working with a few purveyors in the valley who take on the laborious task of collecting these beauties. We will be rocking Gougeres and Truffle butter for the next two months!"},
      { name: "Stay tuned for the winning couple from the CO Bridal Show",
        description: "Their bridal party will be sipping on bold Napa Valley reds and tasting French cheese while cooking with Chef Dave. What do the groomsmen get out of the deal? Beer and butchery! Need we say more?"}
    ]
  end

  def up
    home = Page.find_by(name: "home")

    featured_items.each do |featured_item|
      home.featured_items.create(featured_item)
    end
  end

  def down
    FeaturedItem.all.each do |featured_item|
      featured_item.destroy
    end
  end

end
