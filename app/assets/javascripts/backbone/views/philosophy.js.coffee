BangarangBend.Views.Philosophy ||= {}

class BangarangBend.Views.Philosophy extends Backbone.View
  template: JST["backbone/templates/philosophy"]

  id: 'philosophy-block'
  className: 'inner-content'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "philosophy")
    Backbone.trigger('domchange:title', @page.titleName())

  render: ->
    @$el.html(@template(page: @page, philosophy_items: @collection))
    @
