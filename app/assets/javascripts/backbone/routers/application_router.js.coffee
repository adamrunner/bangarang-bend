class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->

  routes: ->
    ''           : 'homeView'
    'philosophy' : 'philosophyView'
    'services'   : 'servicesView'
    'menu'       : 'menuView'

  homeView: ->
    home     = new BangarangBend.Views.Home()
    featured = new BangarangBend.Views.Featured()
    BangarangBend.content.html(home.render().$el)
    BangarangBend.featured.html(featured.render().$el)

  philosophyView: ->
    philosophy = new BangarangBend.Views.Philosophy()
    BangarangBend.content.html(philosophy.render().$el)
    #TODO dry all views up, should check if featured is rendered before clearing it out
    BangarangBend.featured.html('')

  servicesView: ->
    services = new BangarangBend.Views.Services()
    BangarangBend.content.html(services.render().$el)
    BangarangBend.featured.html('')

  menuView: ->
    menu = new BangarangBend.Views.Menu()
    BangarangBend.content.html(menu.render().$el)
    BangarangBend.featured.html('')
