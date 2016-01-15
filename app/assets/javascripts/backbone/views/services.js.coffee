BangarangBend.Views.Services ||= {}

class BangarangBend.Views.Services extends Backbone.View
  template: JST["backbone/templates/services"]

  id: 'services'
  className: 'col-xs-12 section'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
