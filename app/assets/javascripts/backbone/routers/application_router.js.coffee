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
    philosophy = new BangarangBend.Views.Philosophy()
    @swapPage(philosophy)

  personalizedEventsPage: ->
    personalizedEvents = new BangarangBend.Views.PersonalizedEvents()
    @swapPage(personalizedEvents)

  servicesPage: ->
    services = new BangarangBend.Views.Services()
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
