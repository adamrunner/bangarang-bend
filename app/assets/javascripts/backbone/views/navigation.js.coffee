BangarangBend.Views.SideBar ||= {}

class BangarangBend.Views.Navigation extends Backbone.View
  template: JST["backbone/templates/navigation"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
