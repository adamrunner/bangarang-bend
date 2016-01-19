BangarangBend.Views.Services ||= {}

class BangarangBend.Views.PersonalizedEvents extends Backbone.View
  template: JST["backbone/templates/personalized-events"]

  id: 'services'
  className: 'col-xs-12 section'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
