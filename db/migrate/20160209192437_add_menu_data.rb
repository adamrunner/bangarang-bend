class AddMenuData < ActiveRecord::Migration

  def menu_sections
    menu_sections = [{name: "fuel"}, {name: "primers"}, {name: "harvest"}, {name: "bounty"}, {name: "rewards"}, {name: "nectar"}]
  end

  def fuel_items
    fuel_items = [
      {name: "French Tart", choices: "winter mushroom, shallot, garlic confit, Parmesan Reggiano, bacon lardons", price: "8"},
      {name: "Pastry", choices: "pancetta leek scone, Queensland pumpkin spice muffins, black currant brioche rolls", price: "8"}
    ]
  end

  def primer_items
    primer_items = [
      {name: "Muhammara", choices: "roasted red beet, challah toast points, caramelized veg", price: "3"},
      {name: "Chicken Pate", choices: "roasted, fine herbs, micros, brioche round", price: "3"},
      {name: "Charcuterie", choices: "country pate, pickle, beer mustard, duck prosciutto, sopressata", price: "5"},
      {name: "Quail Egg", choices: "brioche, pancetta, micro arugula", price: "3"},
      {name: "Cheese", choices: "Willamette Valley pinot crush gouda, Mt. Tam, chevre, manchego", price: "4"},
      {name: "Bread Service", choices: "parmesan Reggiano gougeres, Brazilian cheese bread, challah, black truffle butter", price: "3"},
      {name: "Andouille Soup", choices: "wheat berry, Queensland squash, sage, maple", price: "cup..4 bowl..6"},
      {name: "Beer Cheese Soup", choices: "Dead Guy Ale, Tillamook vintage white cheddar, shallot", price: "cup..4 bowl..6"},
      {name: "Country Bread Bowl Addition", choices: "", price: "2"}
    ]
  end

  def harvest_items
    harvest_items = [
      {name: "Citrus", choices: "mache, frisee, blood orange, prosciutto, pomegranate, fennel, yuzu kaffir vinaigrette", price: "side..4 entrée..9"},
      {name: "Bibb", choices: "wheat berry, roasted root veggies, pine nut, herbs, anchovy dressing", price: "side..3 entrée..8"}
    ]
  end

  def bounty_items
    bounty_items = [
      {name: "Pot Roast", choices: "pulled chuck, carrot and turnip slaw, beer mustard, rustique roll", price: "13"},
      {name: "Grilled Muhammara", choices: "rye, pomegranate molasses, sauerkraut, roasted beets, emmantaur", price: "11", special_attr: "V"},
      {name: "Turkey Meatball Roll", choices: "country roll, pork shoulder, red chermoula, mozzarella", price: "13"},
      {name: "Kogi", choices: "marinated flank, kaffir lime, garlic, mirin, daikon slaw, sticky rice", price: "14"},
      {name: "Agnolotti", choices: "butternut squash , brown butter, roasted fennel, herbs", price: "16", special_attr: "V"},
      {name: "Oxtail", choices: "braised, bolognese, pappardelle, romano", price: "13"},
      {name: "Fideo", choices: "(toasted cut vermicelli), preserved lemon, coconut milk, ras el hanout", price: "12", special_attr: "V"},
      {name: "Moussaka", choices: "grass fed beef, parsnip, fried russet, romano bechamel, red sauce, tarragon", price: "11"},
      {name: "Pan Roasted Chicken", choices: "linguica, charred lime, garlic, thyme, poached brown butter fingerlings", price: "23"},
      {name: "Braised Pork Belly", choices: "wheat-berries, tart apple, red cabbage", price: "19"},
      {name: "Tri Tip Roast", choices: "grass fed , espresso rub, mocha stout demi, caramelized root veggies, mash", price: "25"},
      {name: "Butter Chicken", choices: "garam masala, ginger, chilies, cardamom, naan, rice", price: "13"},
      {name: "Turkey Meatball", choices: "pork shoulder, red chermoula, black rice", price: "14"},
      {name: "Spaghetti Squash", choices: "baby kale pesto, chanterelles, roasted golden beets, garlic confit", price: "13", special_attr: "V"}
    ]
  end

  def reward_items
    reward_items = [
      {name: "Apple Crisp", choices: "hard cider, salted caramel", price: "7"},
      {name: "Tiramisu", choices: "espresso, ladyfingers, mascarpone", price: "8"},
      {name: "Pudding Cake", choices: "Medjool date, sticky toffee", price: "7"},
      {name: "Cookies", choices: "chewy oatmeal, kitchen sink, gingersnap", price: "4"}
    ]
  end

  def nectar_items
    nectar_items = [
      {name: "Pellegrino", choices: "sparkling, blood orange, pomegranate", price: "2"},
      {name: "Tea", choices: "seasonal", price: "2"},
      {name: "Fair Trade Coffee", choices: nil, price: "2"}
    ]
  end

  def up
    page = Page.find_by(name: "catering_menus")
    catering_menu = page.catering_menus.create(name: "catering menu")

    menu_sections.each do |section|
      catering_menu.menu_sections.create(section)
    end

    menu_sections.each do |section|
      menu_section = MenuSection.find_by(name: section[:name])
      data = section[:name].singularize << "_items"
      menu_section.menu_items.create(self.send(data))
    end
  end

  def down
    CateringMenu.all.each do |page|
      page.destroy
    end

    MenuSection.all.each do |section|
      section.destroy
    end

    MenuItem.all.each do |item|
      item.destroy
    end
  end

end
