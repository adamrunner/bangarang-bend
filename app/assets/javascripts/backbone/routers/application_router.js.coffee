class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->

  routes:
    '' : 'home'

  home: ->
    home     = new BangarangBend.Views.Home(el: '#home-container')
    featured = new BangarangBend.Views.Featured(el: '#featured-container')
