BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/navigation/mobile_nav"]

  events:
    'click .nav-close'      : 'navClick'

  initialize: ->
    @menus = BangarangBend.menus
    @pages = BangarangBend.pages
    @render()

  render: ->
    @$el.html(@template(pages: @pages, menus: @menus))
    @

  navClick: (event) ->
    Backbone.trigger "navClose", {scroll: true}
