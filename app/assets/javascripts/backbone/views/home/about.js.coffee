BangarangBend.Views.About ||= {}

class BangarangBend.Views.About extends Backbone.View
  template: JST["backbone/templates/home/about"]

  className: 'card about-card m-a-0'

  initialize: ->
    @collection = BangarangBend.biographyItems

  render: ->
    @$el.html(@template(biography_items: @collection))
    @
