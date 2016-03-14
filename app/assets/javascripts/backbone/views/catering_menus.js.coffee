BangarangBend.Views.CateringMenus ||= {}

class BangarangBend.Views.CateringMenus extends Backbone.View
  template: JST["backbone/templates/catering_menus"]

  id: 'catering-menus-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: 'catering_menus')
    @render()

  render: ->
    @$el.html(@template(page: @page, menus: @collection))
    @
