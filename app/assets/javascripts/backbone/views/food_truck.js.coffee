BangarangBend.Views ||= {}

class BangarangBend.Views.FoodTruck extends Backbone.View
  template: JST["backbone/templates/food_truck"]

  id: 'food-truck-block'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "food_truck")
    Backbone.trigger('domchange:title', @page.titleName())

  render: ->
    @$el.html(@template(page: @page, foodTruckImageRows: @collection))
    @$("#copy-text").html(@page.get("copy_text"))
    @
