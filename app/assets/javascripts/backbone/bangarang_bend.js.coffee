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
    @content         = $('#content')
    @router          = new BangarangBend.Routers.ApplicationRouter()
    @mobileNav       = new BangarangBend.Views.MobileNav(el: '#mobile-nav')
    @navbar          = new BangarangBend.Views.Navbar(el: '#navbar')
    @footer          = new BangarangBend.Views.Footer(el: '#footer')
    @contact         = new BangarangBend.Views.Contact(el: '#contact')
    @serviceItems    = new BangarangBend.Collections.ServiceItems()
    @eventItems      = new BangarangBend.Collections.EventItems()
    @philosophyItems = new BangarangBend.Collections.PhilosophyItems()
    @cateringMenus   = new BangarangBend.Collections.CateringMenus()

  loadData: (collection, id, callback) ->
    if id?
      collection.fetch().done () ->
        model = collection.get(id: id)
        model.fetch().done () ->
          callback()
    else if _.isEmpty(collection.models)
      collection.fetch().done () ->
        callback()
    else
      callback()
