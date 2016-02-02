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
    @content   = $('#content')
    @router    = new BangarangBend.Routers.ApplicationRouter()
    @mobileNav = new BangarangBend.Views.MobileNav(el: '#mobile-nav')
    @navbar    = new BangarangBend.Views.Navbar(el: '#navbar')
    @footer    = new BangarangBend.Views.Footer(el: '#footer')
    @contact   = new BangarangBend.Views.Contact(el: '#contact')

# $(document).on "click", "a[href^='/']", (event) ->
#   if !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey
#   	event.preventDefault()
