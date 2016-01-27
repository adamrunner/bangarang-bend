BangarangBend.Views.Footer ||= {}

class BangarangBend.Views.Footer extends Backbone.View
  template: JST["backbone/templates/navigation/footer"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
