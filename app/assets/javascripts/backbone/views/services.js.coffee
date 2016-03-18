BangarangBend.Views.Services ||= {}

class BangarangBend.Views.Services extends Backbone.View
  template: JST["backbone/templates/services"]

  id: 'services-block'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "services")
    @render()

  render: ->
    @$el.html(@template(page: @page, service_items: @collection))
    @
