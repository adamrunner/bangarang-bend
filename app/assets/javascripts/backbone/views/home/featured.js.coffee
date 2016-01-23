BangarangBend.Views.Featured ||= {}

class BangarangBend.Views.Featured extends Backbone.View
  template: JST["backbone/templates/home/featured"]

  className: 'section-inner'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
