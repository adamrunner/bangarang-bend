class AddEventItemData < ActiveRecord::Migration
  def event_items
    event_items = [{name: "June"}, {name: "July"}, {name: "August"}, {name: "September"}]
  end

  def event_produce_items
    event_produce_items = ["asparagus", "boysenberries", "broccoli", "cauliflower", "cherries", "gooseberries", "hazelnuts", "kohlrabi", "radish", "raspberries", "rhubarb", "strawberries", "summer squash", "apricots", "beans", "beets", "blackberries", "blueberries", "cabbage", "carrots", "celery", "cucumber", "eggplant", "figs", "green beans", "melon", "nectarine", "peaches", "parsnip", "peas", "potato", "rutabaga", "tomatoes", "turnips", "zucchini blossoms", "apples", "apricot", "Asian pear", "brusselsprouts", "celery root", "corn", "melons", "nectarines", "parsnips", "peppers", "potatoes", "squash", "plums", "sorrel", "artichokes", "brussels", "grapes", "greenbeans", "kiwi", "leek", "pears", "­tomatoes"]
  end

  def june_items
    june_items = ["asparagus", "boysenberries", "broccoli", "cauliflower", "cherries",
    "gooseberries", "hazelnuts", "kohlrabi", "radish", "raspberries",
    "rhubarb", "strawberries", "summer squash"]
  end

  def july_items
    july_items = ["apricots", "asparagus", "beans", "beets", "blackberries", "blueberries", "broccoli", "boysenberries", "cabbage", "carrots", "cauliflower", "cherries", "celery", "cucumber", "eggplant", "figs", "green beans", "gooseberries", "hazelnuts", "kohlrabi", "melon", "nectarine", "peaches", "parsnip", "peas", "potato", "radish", "raspberries", "rhubarb", "rutabaga", "strawberries", "summer squash", "tomatoes", "turnips", "zucchini blossoms"]
  end

  def august_items
    august_items = ["apples", "apricot", "Asian pear", "beans", "beets", "blackberries", "broccoli", "brussel" "sprouts", "cabbage",
    "carrots", "cauliflower", "celery root", "cherries", "corn", "cucumber", "green beans", "eggplant", "figs",
    "kohlrabi", "melons", "nectarines", "parsnips", "peaches", "peas", "peppers", "potatoes", "radish", "squash",
    "plums", "raspberries", "sorrel", "strawberries", "tomatoes", "turnips", "rutabaga"]
  end

  def september_items
    september_items = ["apples", "artichokes", "blackberries", "broccoli", "brussels", "cabbage", "carrots", "cauliflower",
    "celery root", "corn", "cucumber", "eggplant", "grapes", "green" "beans", "kiwi", "kohlrabi", "leek", "melons",
    "parsnips", "peas", "peppers", "peaches", "pears", "plums", "potatoes", "raspberries", "squash", "­tomatoes", "turnips", "rutabaga"]
  end


  def up
    events = Page.find_by(name: "events")

    event_items.each do |event_item|
      events.event_items.create(event_item)
    end

    event_produce_items.each do |event_produce_item|
      EventProduceItem.create(name: event_produce_item)
    end

    june = EventItem.find_by(name: "june")
    july = EventItem.find_by(name: "july")
    august = EventItem.find_by(name: "august")
    september = EventItem.find_by(name: "september")

    june_items.each do |june_item|
      june.event_produce_items<<(EventProduceItem.find_by(name: june_item))
    end

    july_items.each do |july_item|
      july.event_produce_items<<(EventProduceItem.find_by(name: july_item))
    end

    august_items.each do |august_item|
      august.event_produce_items<<(EventProduceItem.find_by(name: august_item))
    end

    september_items.each do |september_item|
      september.event_produce_items<<(EventProduceItem.find_by(name: september_item))
    end
  end

  def down
    EventItem.all.each do |event_item|
      event_item.destroy
    end

    EventProduceItem.all.each do |event_produce_item|
      event_produce_item.destroy
    end
  end

end
