BangarangBend.Views.CateringMenus ||= {}

class BangarangBend.Views.CateringMenus extends Backbone.View
  template: JST["backbone/templates/catering_menus"]

  id: 'catering-menus-block'
  className: 'inner-content'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: 'catering_menus')
    Backbone.trigger('domchange:title', @page.titleName())

  render: ->
    @$el.html(@template(page: @page, menus: @collection))
    @
