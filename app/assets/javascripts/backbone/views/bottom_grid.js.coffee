BangarangBend.Views.BottomGrid ||= {}

class BangarangBend.Views.BottomGrid extends Backbone.View
  template: JST["backbone/templates/bottom_grid"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
