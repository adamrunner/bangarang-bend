BangarangBend.Views.Philosophy ||= {}

class BangarangBend.Views.Philosophy extends Backbone.View
  template: JST["backbone/templates/philosophy"]

  id: 'philosophy'
  className: 'card card-block shadow'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(philosophy_items: @collection))
    @
