class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->

  routes: ->
    ''                    : 'homePage'
    'philosophy'          : 'philosophyPage'
    'services'            : 'servicesPage'
    'menu'                : 'menuPage'
    'personalized-events' : 'personalizedEventsPage'

  homePage: ->
    @home = new BangarangBend.Views.Home()
    @swapPage(@home)

  philosophyPage: ->
    BangarangBend.loadData BangarangBend.philosophyItems, =>
      philosophyItems = new BangarangBend.Views.Philosophy(collection: BangarangBend.philosophyItems)
      @swapPage(philosophyItems)

  personalizedEventsPage: ->
    BangarangBend.loadData BangarangBend.eventItems, =>
      eventItems = new BangarangBend.Views.PersonalizedEvents(collection: BangarangBend.eventItems)
      @swapPage(eventItems)

  servicesPage: ->
    BangarangBend.loadData BangarangBend.serviceItems, =>
      services = new BangarangBend.Views.Services(collection: BangarangBend.serviceItems)
      @swapPage(services)

  menuPage: ->
    menu = new BangarangBend.Views.Menu()
    @swapPage(menu)

  swapPage: (view) ->
    if @currentView
      if @currentView.subViews
        @currentView.subViews.forEach (view) ->
          view.remove()
      @currentView.remove()
      @currentView = view
      BangarangBend.content.html(view.render().$el)
      window.scrollTo(0,0)
    else
      @currentView = view
      BangarangBend.content.html(view.render().$el)
