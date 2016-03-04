BangarangBend.Views.CateringMenu ||= {}

class BangarangBend.Views.CateringMenu extends Backbone.View
  template: JST["backbone/templates/catering_menu"]

  id: 'catering-menu-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(catering_menu: @model))
    @
