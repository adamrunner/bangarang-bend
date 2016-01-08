BangarangBend.Views.Navigation ||= {}

class BangarangBend.Views.Navigation extends Backbone.View
  template: JST["backbone/templates/navigation"]

  events:
    'click a' : 'navClick'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  navClick: ->
    if BangarangBend.menuToggled
      Backbone.trigger "navClose"
