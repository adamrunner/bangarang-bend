BangarangBend.Views.Landing ||= {}

class BangarangBend.Views.Landing extends Backbone.View
  template: JST["backbone/templates/home/landing"]

  className: 'inner'

  initialize: ->
    @model = BangarangBend.landing

  render: ->
    @$el.html(@template(landing: @model))
    @
