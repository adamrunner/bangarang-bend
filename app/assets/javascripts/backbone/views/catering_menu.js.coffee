BangarangBend.Views.CateringMenu ||= {}

class BangarangBend.Views.CateringMenu extends Backbone.View
  template: JST["backbone/templates/catering_menu"]

  id: 'menu-container'
  className: 'card card-block shadow'

  initialize: ->
    console.log(@model)
    @render()

  render: ->
    @$el.html(@template(catering_menu: @model))
    @
