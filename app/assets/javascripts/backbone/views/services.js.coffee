BangarangBend.Views.Services ||= {}

class BangarangBend.Views.Services extends Backbone.View
  template: JST["backbone/templates/services"]

  id: 'services-block'
  className: 'inner-content'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "services")
    Backbone.trigger('domchange:title', @page.titleName())

  render: ->
    @$el.html(@template(page: @page, service_items: @collection))
    @
