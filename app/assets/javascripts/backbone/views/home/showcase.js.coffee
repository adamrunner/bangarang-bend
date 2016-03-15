BangarangBend.Views.Showcase ||= {}

class BangarangBend.Views.Showcase extends Backbone.View
  template: JST["backbone/templates/home/showcase"]

  className: 'showcase-inner'

  initialize: ->
    @pages = BangarangBend.pages

  render: ->
    @$el.html(@template(pages: @pages))
    @
