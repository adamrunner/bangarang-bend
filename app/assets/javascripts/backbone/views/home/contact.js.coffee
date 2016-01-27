BangarangBend.Views.Contact ||= {}

class BangarangBend.Views.Contact extends Backbone.View
  template: JST["backbone/templates/home/contact"]

  className: 'section-inner'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
