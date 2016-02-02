BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/navigation/mobile_nav"]

  events:
    'click a' : 'navClick'

  initialize: ->
    @listenTo BangarangBend.router, 'route', @setActive
    @render()

  render: ->
    @$el.html(@template())
    @

  navClick: ->
    if BangarangBend.menuToggled
      Backbone.trigger "navClose"

  setActive: (event) ->
    @$('li.active').removeClass('active')
    @$("##{event}").addClass('active')
