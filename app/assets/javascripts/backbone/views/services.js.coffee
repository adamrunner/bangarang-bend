BangarangBend.Views.Services ||= {}

class BangarangBend.Views.Services extends Backbone.View
  template: JST["backbone/templates/services"]

  id: 'services'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
