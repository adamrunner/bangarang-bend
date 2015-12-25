class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    '' : 'home'

  home: ->
    view = new BangarangBend.Views.Home(el: '#content')
