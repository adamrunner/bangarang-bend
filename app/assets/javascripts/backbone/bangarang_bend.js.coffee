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
    @featured   = $('#featured')
    @bgImages   = new BangarangBend.Collections.BgImages(options.data.bg_images)
    @router     = new BangarangBend.Routers.ApplicationRouter()
    @navigation = new BangarangBend.Views.Navigation(el: '#navigation')
    @mobileNav  = new BangarangBend.Views.MobileNav(el: '#mobile-nav-bar')
    @bgCarousel = new BangarangBend.Views.BgCarousel(el: '#background-carousel', collection: @bgImages)

# $(document).on "click", "a[href^='/']", (event) ->
#   if !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey
#   	event.preventDefault()
