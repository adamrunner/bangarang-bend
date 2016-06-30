BangarangBend.Views ||= {}

class BangarangBend.Views.FoodTruck extends Backbone.View
  template: JST["backbone/templates/food_truck"]

  id: 'food-truck-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "food_truck")
    @render()

  render: ->
    @$el.html(@template(page: @page))
    @
