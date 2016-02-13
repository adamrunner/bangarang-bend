class AddPageData < ActiveRecord::Migration
  def pages
    pages = [
      {name: "home", link_name: "home"},
      {name: "services", link_name: "services"},
      {name: "catering_menus", link_name: "catering menus"}, 
      {name: "events", link_name: "events"},
      {name: "philosophy", link_name: "philosophy"}
    ]
  end

  def up
    pages.each do |page|
      Page.create(page)
    end
  end

  def down
    Page.all.each do |page|
      page.destroy
    end
  end

end
