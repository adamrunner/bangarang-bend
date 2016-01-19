class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->

  routes: ->
    ''                    : 'homeView'
    'philosophy'          : 'philosophyView'
    'services'            : 'servicesView'
    'menu'                : 'menuView'
    'personalized-events' : 'personalizedEventsView'

  homeView: ->
    home     = new BangarangBend.Views.Home()
    featured = new BangarangBend.Views.Featured()
    @swapView([home, featured])

  philosophyView: ->
    philosophy = new BangarangBend.Views.Philosophy()
    @swapView([philosophy])
    #TODO dry all views up, should check if featured is rendered before clearing it out

  personalizedEventsView: ->
    personalizedEvents = new BangarangBend.Views.PersonalizedEvents()
    @swapView([personalizedEvents])

  servicesView: ->
    services = new BangarangBend.Views.Services()
    @swapView([services])

  menuView: ->
    menu = new BangarangBend.Views.Menu()
    @swapView([menu])

  swapView: (view) ->
    @newView = view
    if @currentView
      @animateViewsOut()
    else
      @currentView = view
      BangarangBend.content.html(view[0].render().$el)
      if view.length > 1
        BangarangBend.content.append(view[1].render().$el)

  animateOut: (view, boolean) ->
    view.$el.velocity "transition.slideLeftOut", delay: 100, duration: 300, complete: =>
      if boolean && boolean == true
        @removeViews()
        @animateViewsIn()

  animateIn: (view) ->
    view.velocity("transition.slideRightIn", delay: 100, duration: 300)

  removeViews: ->
    if @currentView.length > 1
      @currentView[0].remove()
      @currentView[1].remove()
    else
      @currentView[0].remove()

  animateViewsOut: ->
    if @currentView.length > 1
      @animateOut(@currentView[0])
      @animateOut(@currentView[1], true)
    else
      @animateOut(@currentView[0], true)

  animateViewsIn: ->
    @currentView = @newView
    if @currentView.length > 1
      BangarangBend.content.html(@currentView[0].render().$el.css({opacity: "0"}))
      BangarangBend.content.append(@currentView[1].render().$el.css({opacity: "0"}))
      @animateIn(@currentView[0].$el)
      @animateIn(@currentView[1].$el)
    else
      BangarangBend.content.html(@currentView[0].render().$el.css({opacity: "0"}))
      @animateIn(@currentView[0].$el)
