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
    @pages              = new BangarangBend.Collections.Pages(options.data.pages)
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
    @registerAnimations()
    @appListeners()

  appListeners: ->
    @listenTo Backbone, 'domchange:title', @onDomChangeTitle

  registerAnimations: ->
    $.Velocity.RegisterEffect('overlayShow', {
    defaultDuration: 250,
    calls: [
        [ { borderColor: '#333' }, 0.5 ],
        [ { height: '100%', fontSize: '+=0.5em', color: '#C34C3B'}, 0.5 ]
    ]
    })
    .RegisterEffect('overlayShrink', {
    defaultDuration: 250,
    calls: [
        [ { height: '3.5rem', fontSize: '1em', borderColor: '#C34C3B'}, 0.5 ],
        [ { color: '#CEC7C6' }, 0.5 ]
    ]
    })

  onDomChangeTitle: (title) ->
    $(document).attr('title', title)
