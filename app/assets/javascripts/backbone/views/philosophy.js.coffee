BangarangBend.Views.Philosophy ||= {}

class BangarangBend.Views.Philosophy extends Backbone.View
  template: JST["backbone/templates/philosophy"]

  id: 'philosophy'
  className: 'col-xs-12 section'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
