BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/navigation/mobile_nav"]

  events:
    'click .mobile-nav-link'   : 'navClick'
    'touchmove' : 'noScroll'

  initialize: ->
    @listenTo Backbone, 'navClosed', @scrollTop
    @render()

  render: ->
    @$el.html(@template())
    @

  navClick: (event) ->
    Backbone.trigger "navClose"

  scrollTop: ->
    $('body').velocity('scroll', {duration: 1000, easing: 'easeOutQuad' })

  noScroll: (event) ->
    event.preventDefault()
