BangarangBend.Views.Featured ||= {}

class BangarangBend.Views.Featured extends Backbone.View
  template: JST["backbone/templates/home/featured"]

  className: 'inner'

  initialize: ->
    @collection = BangarangBend.featuredItems

  render: ->
    @$el.html(@template(featured_items: @collection))
    @
