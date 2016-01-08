BangarangBend.Views.Philosophy ||= {}

class BangarangBend.Views.Philosophy extends Backbone.View
  template: JST["backbone/templates/philosophy"]

  id: 'philosophy'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
