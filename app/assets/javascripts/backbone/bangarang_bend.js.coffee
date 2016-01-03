#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BangarangBend =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: () ->
    @router     = new BangarangBend.Routers.ApplicationRouter()
    @navigation = new BangarangBend.Views.Navigation(el: '#navigation')
    @mobileMenu = new BangarangBend.Views.MobileNav(el: '#mobile-nav')

$(document).ready ->
  BangarangBend.initialize()
  Backbone.history.start()
