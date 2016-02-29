BangarangBend.Views.Featured ||= {}

class BangarangBend.Views.Featured extends Backbone.View
  template: JST["backbone/templates/home/featured"]

  className: 'card card-featured'

  initialize: ->
    @collection = BangarangBend.featuredItems
    @render()

  render: ->
    @$el.html(@template(featured_items: @collection))
    @
