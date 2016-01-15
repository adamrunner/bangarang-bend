BangarangBend.Views.Home ||= {}

class BangarangBend.Views.Home extends Backbone.View
  template: JST["backbone/templates/home"]

  className: 'col-xs-12 home'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
