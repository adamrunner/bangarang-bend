BangarangBend.Views.About ||= {}

class BangarangBend.Views.About extends Backbone.View
  template: JST["backbone/templates/home/about"]

  className: 'card card-featured m-a-0'

  initialize: ->
    @collection = BangarangBend.biographyItems
    @render()

  render: ->
    @$el.html(@template(biography_items: @collection))
    @
