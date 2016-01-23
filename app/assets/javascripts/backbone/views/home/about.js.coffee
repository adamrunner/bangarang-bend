BangarangBend.Views.About ||= {}

class BangarangBend.Views.About extends Backbone.View
  template: JST["backbone/templates/home/about"]

  className: 'section-inner'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
