BangarangBend.Views.CateringMenu ||= {}

class BangarangBend.Views.CateringMenu extends Backbone.View
  template: JST["backbone/templates/catering_menu"]

  id: 'catering-menu-block'
  className: 'inner-content'

  initialize: ->
    Backbone.trigger('domchange:title', "BangarangBend - #{@model.get('name').titleize()}")

  render: ->
    @$el.html(@template(catering_menu: @model))
    @
