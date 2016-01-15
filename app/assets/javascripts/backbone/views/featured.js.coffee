BangarangBend.Views.Featured ||= {}

class BangarangBend.Views.Featured extends Backbone.View
  template: JST["backbone/templates/featured"]

  className: 'col-xs-12 featured'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
