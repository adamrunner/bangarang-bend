class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->

  routes: ->
    ''           : 'homeView'
    'philosophy' : 'philosophyView'
    'services'   : 'servicesView'

  homeView: ->
    home     = new BangarangBend.Views.Home()
    featured = new BangarangBend.Views.Featured()
    BangarangBend.content.html(home.render().$el)
    BangarangBend.content.append(featured.render().$el)

  philosophyView: ->
    philosophy = new BangarangBend.Views.Philosophy()
    BangarangBend.content.html(philosophy.render().$el)

  servicesView: ->
    services = new BangarangBend.Views.Services()
    BangarangBend.content.html(services.render().$el)
