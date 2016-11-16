#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./svg

window.BangarangBend =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  initialize: (options) ->
    @pages              = new BangarangBend.Collections.Pages(options.data.pages)
    @landing            = new BangarangBend.Models.Landing(options.data.landing)
    @address            = new BangarangBend.Models.Address(options.data.address)
    @instagramImages    = new BangarangBend.Collections.InstagramImages(options.data.instagram_images)
    @featuredItems      = new BangarangBend.Collections.FeaturedItems(options.data.featured_items)
    @biographyItems     = new BangarangBend.Collections.BiographyItems(options.data.biography_items)
    @menus              = new BangarangBend.Collections.CateringMenus(options.data.menus)
    @content            = $('#content')
    @router             = new BangarangBend.Routers.ApplicationRouter()
    @mobileNav          = new BangarangBend.Views.MobileNav(el: '#mobile-nav')
    @navbar             = new BangarangBend.Views.Navbar(el: '#navbar')
    @serviceItems       = new BangarangBend.Collections.ServiceItems(options.data.service_items)
    @philosophyItems    = new BangarangBend.Collections.PhilosophyItems(options.data.philosophy_items)
    @foodTruckImageRows = new BangarangBend.Collections.FoodTruckImageRows(options.data.food_truck_image_rows)
    @farms              = new BangarangBend.Collections.Farms(options.data.farms)
    _.extend(@, Backbone.Events);
    @appListeners()

  appListeners: ->
    @listenTo Backbone, 'domchange:title', @onDomChangeTitle

  onDomChangeTitle: (title) ->
    $(document).attr('title', title)
