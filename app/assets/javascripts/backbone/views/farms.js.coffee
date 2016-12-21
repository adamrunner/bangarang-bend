BangarangBend.Views ||= {}

class BangarangBend.Views.Farms extends Backbone.View
  template: JST["backbone/templates/farms"]

  id: 'farms-block'
  className: 'inner-content'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "the_farms")
    Backbone.trigger('domchange:title', @page.titleName())

  render: ->
    @$el.html(@template(page: @page, farms: @collection))
    @$("#copy-text").html(@page.get("copy_text"))
    @
