BangarangBend.Views.Services ||= {}

class BangarangBend.Views.PersonalizedEvents extends Backbone.View
  template: JST["backbone/templates/personalized-events"]

  id: 'services'
  className: 'page-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
