BangarangBend.Views.SideBar ||= {}

class BangarangBend.Views.SideBar extends Backbone.View
  template: JST["backbone/templates/side_bar"]

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @
