BangarangBend.Views.Showcase ||= {}

class BangarangBend.Views.Showcase extends Backbone.View
  template: JST["backbone/templates/home/showcase"]

  className: 'showcase-inner'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
