class AddPhilosophyData < ActiveRecord::Migration
  def philosophy_items
    philosophy_items = [
      {
        name: "Seasonality",
        description: "Our menu is 100% based on seasonally available and organic ingredients and is changing constantly.  If you care about where your food comes from, we may be the caterer for you."
      },{
        name: "Benefits",
        description: "When we shop, cook, and eat seasonally we do a number of great things. First, we support our local farms and ranches who bring food  to our tables.  Second, we ensure we are getting products at the best version of themselves and simultaneously at their best values.  We keep a perfect Oregon strawberry exactly where it belongs; signifying the beginning of summer, where it makes the biggest impact on our minds and palates. In the dead of winter, we would serve a perfect pomegranate or quince instead."
      },{
        name: "Low Impact",
        description: "Sustainability in a time of enlightenment should be important to us all. At BANGARANG we strive to utilize whole products while composting the unusable portions. We purchase from low impact purveyors and recycle everything possible. In doing this, we have adopted a “no disposables” policy. We have seen firsthand the exorbitant amount of waste that takes place in the restaurant industry and this is an area we can all make an impact in while helping to keep our beautiful Central Oregon the place we have come to love."
      },{
        name: "Experience",
        description: "Experience has taught us that certain foods adapt well to catered events while others do not. We center our menu around foods that hold presentation and flavors well. We strive to put forth entrees that will be as delicious at your event as they were the day of your tasting."
      }
    ]
  end

  def up
    page = Page.find_by(name: "philosophy")

    philosophy_items.each do |philosophy_item|
      page.philosophy_items.create(philosophy_item)
    end
  end

  def down
    PhilosophyItem.all.each do |philosophy_item|
      philosophy_item.destroy
    end
  end
end
