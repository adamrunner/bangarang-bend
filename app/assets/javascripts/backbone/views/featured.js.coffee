BangarangBend.Views.Featured ||= {}

class BangarangBend.Views.Featured extends Backbone.View
  template: JST["backbone/templates/featured"]

  id: 'featured-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
