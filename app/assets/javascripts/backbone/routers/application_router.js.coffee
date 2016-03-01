class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->

  routes: ->
    ''                    : 'homePage'
    'philosophy'          : 'philosophyPage'
    'services'            : 'servicesPage'
    'catering_menus'      : 'cateringMenusPage'
    'catering_menu/:id'   : 'cateringMenu'
    'personalized-events' : 'personalizedEventsPage'

  homePage: ->
    @home = new BangarangBend.Views.Home()
    @swapPage(@home)

  philosophyPage: ->
    BangarangBend.loadData BangarangBend.philosophyItems, null, =>
      philosophyItems = new BangarangBend.Views.Philosophy(collection: BangarangBend.philosophyItems)
      @swapPage(philosophyItems)

  personalizedEventsPage: ->
    BangarangBend.loadData BangarangBend.eventItems, null, =>
      eventItems = new BangarangBend.Views.PersonalizedEvents(collection: BangarangBend.eventItems)
      @swapPage(eventItems)

  servicesPage: ->
    BangarangBend.loadData BangarangBend.serviceItems, null, =>
      services = new BangarangBend.Views.Services(collection: BangarangBend.serviceItems)
      @swapPage(services)

  cateringMenusPage: ->
    BangarangBend.loadData BangarangBend.cateringMenus, null, =>
      cateringMenus = new BangarangBend.Views.CateringMenus(collection: BangarangBend.cateringMenus)
      @swapPage(cateringMenus)

  cateringMenu: (id) ->
    BangarangBend.loadData BangarangBend.cateringMenus, id, =>
      cateringMenu = new BangarangBend.Views.CateringMenu(model: BangarangBend.cateringMenus.get(id: id))
      @swapPage(cateringMenu)

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
