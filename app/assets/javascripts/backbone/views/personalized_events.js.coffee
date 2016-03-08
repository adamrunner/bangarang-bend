BangarangBend.Views.PersonalizedEvents ||= {}

class BangarangBend.Views.PersonalizedEvents extends Backbone.View
  template: JST["backbone/templates/personalized-events"]

  id: 'personalized-events-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(event_items: @collection))
    @
