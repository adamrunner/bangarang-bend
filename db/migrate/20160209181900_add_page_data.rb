class AddPageData < ActiveRecord::Migration
  def pages
    pages = [
      {name: "home", link_name: "home", description: "Create, Update, and Delete Featured Items on the Homepage. Also update your Biographies."},
      {name: "services", link_name: "services", description: "Create, Update, and Delete items from your Services Offered list."},
      {name: "catering_menus", link_name: "catering menus", description: "Create, Update and Delete whole entire Catering Menus, as well as their sections and menu items."},
      {name: "events", link_name: "personalized events", description: "Manage which local produce will be available during each month. Also Create, Update and Delete items from your produce list. "},
      {name: "philosophy", link_name: "philosophy", description: "Changed your way of thinking? Let your users know! Create, Update and Delete your philosophies here."}
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
