BangarangBend.Views.Philosophy ||= {}

class BangarangBend.Views.Philosophy extends Backbone.View
  template: JST["backbone/templates/philosophy"]

  id: 'philosophy'
  className: 'page-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(philosophy_items: @collection))
    @
