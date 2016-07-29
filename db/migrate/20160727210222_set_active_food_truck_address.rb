class SetActiveFoodTruckAddress < ActiveRecord::Migration
  page = Page.find_by(name: "food_truck")
  page.show_copy_text = true
  page.copy_text = "Book the BANGARANG Mobile Kitchen for your next event. We will custom build an organic, responsibly sourced hyper-seasonal menu for you. Whether you are hosting an intimate party for friends and family at your home or you have a hundred hard working employees you want to treat to lunch we will work out a service that caters specifically to you.

  With the mobile kitchen you don’t have to worry about all of the logistics of a typical catered event. You simply give us a time and place and we roll up ready to BANGARANG!

  (Minimum order amounts apply)"
  page.save


  address = page.food_truck_addresses.build()
  address.description = "come find us at 542 nw arizona ave bend, or 97701. tuesday through saturday 11 to 7"
  address.active = true
  address.link_url = "https://goo.gl/maps/PKJt5XiSPBu"
  address.save
end
