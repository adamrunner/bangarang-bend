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
    @sideBar    = new BangarangBend.Views.SideBar(el: '#side-bar')
    @bottomGrid = new BangarangBend.Views.BottomGrid(el: '#bottom-grid')

$(document).ready ->
  BangarangBend.initialize()
  Backbone.history.start()
