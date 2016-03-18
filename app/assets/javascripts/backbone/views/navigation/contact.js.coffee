BangarangBend.Views.Contact ||= {}

class BangarangBend.Views.Contact extends Backbone.View
  template: JST["backbone/templates/navigation/contact"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
