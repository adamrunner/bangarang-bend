BangarangBend.Views.Services ||= {}

class BangarangBend.Views.Services extends Backbone.View
  template: JST["backbone/templates/services"]

  id: 'services'
  className: 'card card-block shadow'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(service_items: @collection))
    @
