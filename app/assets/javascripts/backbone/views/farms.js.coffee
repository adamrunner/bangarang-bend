BangarangBend.Views ||= {}

class BangarangBend.Views.Farms extends Backbone.View
  template: JST["backbone/templates/farms"]

  # id: 'customized-events-block'
  # className: 'card card-block shadow hidden'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "farms")
    Backbone.trigger('domchange:title', @page.titleName())
    @render()

  render: ->
    @$el.html(@template(page: @page))
    # @$("#copy-text").html(@page.get("copy_text"))
    @
