BangarangBend.Views.Services ||= {}

class BangarangBend.Views.Services extends Backbone.View
  template: JST["backbone/templates/services"]

  id: 'services-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(service_items: @collection))
    @
