class BangarangBend.Routers.ApplicationRouter extends Backbone.Router

  routes:
    ''                    : 'homePage'
    'philosophy'          : 'philosophyPage'
    'services'            : 'servicesPage'
    'menus'               : 'menusPage'
    'menu/:id'            : 'menuPage'
    'personalized_events' : 'personalizedEventsPage'

  homePage: ->
    home = new BangarangBend.Views.Home()
    @swapPage(home)

  philosophyPage: ->
    philosophyItems = new BangarangBend.Views.Philosophy(collection: BangarangBend.philosophyItems)
    @swapPage(philosophyItems)

  personalizedEventsPage: ->
    eventItems = new BangarangBend.Views.PersonalizedEvents(collection: BangarangBend.eventItems)
    @swapPage(eventItems)

  servicesPage: ->
    services = new BangarangBend.Views.Services(collection: BangarangBend.serviceItems)
    @swapPage(services)

  menusPage: ->
    cateringMenus = new BangarangBend.Views.CateringMenus(collection: BangarangBend.menus)
    @swapPage(cateringMenus)

  menuPage: (id) ->
    cateringMenu = new BangarangBend.Views.CateringMenu(model: BangarangBend.menus.get(id: id))
    @swapPage(cateringMenu)

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
