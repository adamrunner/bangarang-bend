BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/navigation/mobile_nav"]

  events:
    'click .nav-close'      : 'navClick'
    # 'touchmove'             : 'noScroll'

  initialize: ->
    @menus = BangarangBend.menus
    @render()

  render: ->
    @$el.html(@template(menus: @menus))
    @

  navClick: (event) ->
    Backbone.trigger "navClose", {scroll: true}

  # noScroll: (event) ->
    # event.preventDefault()
