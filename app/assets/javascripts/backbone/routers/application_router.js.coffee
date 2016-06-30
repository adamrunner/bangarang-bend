class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: ->
    pages = BangarangBend.pages
    @route pages.at(0).link(), 'homePage'
    @route pages.at(1).link(), 'servicesPage'
    @route pages.at(2).link(), 'menusPage'
    @route "#{pages.at(2).link()}/:name", 'menuPage'
    @route pages.at(3).link(), 'customizedEventsPage'
    @route pages.at(4).link(), 'philosophyPage'
    @route pages.at(5).link(), 'foodTruckPage'

  # routes: ->

  homePage: ->
    home = new BangarangBend.Views.Home()
    @swapPage(home)

  philosophyPage: ->
    philosophyItems = new BangarangBend.Views.Philosophy(collection: BangarangBend.philosophyItems)
    @swapPage(philosophyItems)

  customizedEventsPage: ->
    eventItems = new BangarangBend.Views.CustomizedEvents(collection: BangarangBend.eventItems)
    @swapPage(eventItems)

  servicesPage: ->
    services = new BangarangBend.Views.Services(collection: BangarangBend.serviceItems)
    @swapPage(services)

  menusPage: ->
    menus = new BangarangBend.Views.CateringMenus(collection: BangarangBend.menus)
    @swapPage(menus)

  menuPage: (name) ->
    menu = new BangarangBend.Views.CateringMenu(model: BangarangBend.menus.findWhere(name: name.replace(/_/g, ' ')))
    @swapPage(menu)

  foodTruckPage: ->
    foodTruck = new BangarangBend.Views.FoodTruck()
    @swapPage(foodTruck)

  swapPage: (view) ->
    if @currentView
      if @currentView.subViews
          @currentView.subViews.forEach (view) ->
            view.remove()
          @currentView.remove()
          @currentView = view
          BangarangBend.content.html(view.render().$el.velocity("fadeIn", duration: 400))
      else
        @currentView.remove()
        @currentView = view
        BangarangBend.content.html(view.render().$el.velocity("fadeIn", duration: 400))
    else
      @currentView = view
      BangarangBend.content.html(view.render().$el.velocity("fadeIn", duration: 400))
