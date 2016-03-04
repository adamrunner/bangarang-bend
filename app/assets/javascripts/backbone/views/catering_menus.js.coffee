BangarangBend.Views.CateringMenus ||= {}

class BangarangBend.Views.CateringMenus extends Backbone.View
  template: JST["backbone/templates/catering_menus"]

  id: 'catering-menus-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(catering_menus: @collection))
    @
