BangarangBend.Views.Menu ||= {}

class BangarangBend.Views.Menu extends Backbone.View
  template: JST["backbone/templates/menu"]

  id: 'menu-container'
  className: 'page-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
