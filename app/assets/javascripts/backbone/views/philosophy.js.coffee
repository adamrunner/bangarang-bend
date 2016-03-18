BangarangBend.Views.Philosophy ||= {}

class BangarangBend.Views.Philosophy extends Backbone.View
  template: JST["backbone/templates/philosophy"]

  id: 'philosophy-block'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "philosophy")
    @render()

  render: ->
    @$el.html(@template(page: @page, philosophy_items: @collection))
    @
