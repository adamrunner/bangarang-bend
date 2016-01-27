BangarangBend.Views.Home ||= {}

class BangarangBend.Views.Home extends Backbone.View
  template: JST["backbone/templates/home/home"]

  className: 'page-view'
  id: 'home-page'

  initialize: ->
    @createSubViews()
    @render()

  render: ->
    @$el.html(@template())
    @$('#featured').append(@featured.render().$el)
    @$('#showcase').append(@showcase.render().$el)
    @$('#about').append(@about.render().$el)
    @$('#contact').append(@contact.render().$el)
    @

  createSubViews: ->
    @featured = new BangarangBend.Views.Featured()
    @showcase = new BangarangBend.Views.Showcase()
    @about    = new BangarangBend.Views.About()
    @contact  = new BangarangBend.Views.Contact()
