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
    @content    = $('#content')
    @router     = new BangarangBend.Routers.ApplicationRouter()
    @navigation = new BangarangBend.Views.Navigation(el: '#navigation')
    @navbar     = new BangarangBend.Views.Navbar(el: '#navbar')
    @footer     = new BangarangBend.Views.Footer(el: '#footer')

# $(document).on "click", "a[href^='/']", (event) ->
#   if !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey
#   	event.preventDefault()
