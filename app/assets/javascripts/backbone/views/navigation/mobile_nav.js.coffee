BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/navigation/mobile_nav"]

  events:
    'click .mobile-nav-link'   : 'navClick'
    'touchmove' : 'noScroll'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  navClick: (event) ->
    Backbone.trigger "navClose"
    $('body').velocity('scroll', {offset: "-70px", duration: 1500, delay: 600, easing: 'easeOutQuad' })

  noScroll: (event) ->
    event.preventDefault()
