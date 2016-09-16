class BangarangBend.Routers.ApplicationRouter extends Backbone.Router

  initialize: ->
    # dynamically create routes

    # route names are based off of the Page 'link_name' attribute

    # route method names are based off of the Page 'name' attribute

    # nested route method names, such as catering_menu (called by matching the route catering_menus/:name) are based off of a singularized
    # version of the parent name, which is stored in the 'singularized' attribute on the parent model. In this case the
    # parent model is Page.findWhere({name: 'catering_menus'})

    pages = BangarangBend.pages
    pages.forEach (page) =>
      @route page.link(), page.get('name')
      if page.get('nested_links') == true
        @route "#{page.link()}/:name", page.get('singularized')

  # ====================== #

  home: ->
    home = new BangarangBend.Views.Home()
    @swapPage(home)

  philosophy: ->
    philosophyItems = new BangarangBend.Views.Philosophy(collection: BangarangBend.philosophyItems)
    @swapPage(philosophyItems)

  the_farms: ->
    farms = new BangarangBend.Views.Farms(collection: BangarangBend.farms)
    @swapPage(farms)

  services: ->
    services = new BangarangBend.Views.Services(collection: BangarangBend.serviceItems)
    @swapPage(services)

  catering_menus: ->
    menus = new BangarangBend.Views.CateringMenus(collection: BangarangBend.menus)
    @swapPage(menus)

  catering_menu: (name) ->
    menu = new BangarangBend.Views.CateringMenu(model: BangarangBend.menus.findWhere(name: name.replace(/_/g, ' ')))
    @swapPage(menu)

  food_truck: ->
    foodTruck = new BangarangBend.Views.FoodTruck(collection: BangarangBend.foodTruckImageRows)
    @swapPage(foodTruck)

  swapPage: (view) ->
    if @currentView
      if @currentView.subViews
          @currentView.subViews.forEach (view) ->
            view.remove()
          @currentView.remove()
          @currentView = view
          BangarangBend.content.html(view.render().$el.velocity("fadeIn", duration: 300))
      else
        @currentView.remove()
        @currentView = view
        BangarangBend.content.html(view.render().$el.velocity("fadeIn", duration: 300))
    else
      @currentView = view
      BangarangBend.content.html(view.render().$el.velocity("fadeIn", duration: 300))
