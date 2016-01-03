BangarangBend.Views.BottomGrid ||= {}

class BangarangBend.Views.Featured extends Backbone.View
  template: JST["backbone/templates/featured"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
