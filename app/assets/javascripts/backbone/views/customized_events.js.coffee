BangarangBend.Views ||= {}

class BangarangBend.Views.CustomizedEvents extends Backbone.View
  template: JST["backbone/templates/customized-events"]

  id: 'customized-events-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(event_items: @collection))
    @
