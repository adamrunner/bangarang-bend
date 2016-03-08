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
  initialize: (options) ->
    @featuredItems   = new BangarangBend.Collections.FeaturedItems(options.data.featured_items)
    @biographyItems  = new BangarangBend.Collections.BiographyItems(options.data.biography_items)
    @menus           = new BangarangBend.Collections.CateringMenus(options.data.menus)
    @content         = $('#content')
    @router          = new BangarangBend.Routers.ApplicationRouter()
    @mobileNav       = new BangarangBend.Views.MobileNav(el: '#mobile-nav')
    @navbar          = new BangarangBend.Views.Navbar(el: '#navbar')
    @footer          = new BangarangBend.Views.Footer(el: '#footer')
    @contact         = new BangarangBend.Views.Contact(el: '#contact')
    @serviceItems    = new BangarangBend.Collections.ServiceItems(options.data.service_items)
    @eventItems      = new BangarangBend.Collections.EventItems(options.data.event_items)
    @philosophyItems = new BangarangBend.Collections.PhilosophyItems(options.data.philosophy_items)
    console.log(@serviceItems)
    console.log(@eventItems)
    console.log(@philosophyItems)
    Backbone.history.on "route", ->
      if location.href.slice(-1) == '#'
        location.replace(location.href + "home")
      else if location.href.slice(-1) == "/"
        location.replace(location.href + "#home")
      return

$(document).ready ->
  if location.href.slice(-1) == '/'
    location.replace(location.href + '#home')
  return
