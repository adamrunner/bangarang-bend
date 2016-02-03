BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/navigation/mobile_nav"]

  events:
    'click a'   : 'navClick'
    'touchmove' : 'noScroll'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  navClick: ->
    if BangarangBend.menuToggled
      Backbone.trigger "navClose"

  noScroll: (event) ->
    event.preventDefault()
