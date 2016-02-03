BangarangBend.Views.Home ||= {}

class BangarangBend.Views.Home extends Backbone.View
  template: JST["backbone/templates/home/home"]

  className: 'page-view'
  id: 'home-page'

  events: ->
    'click #contact-btn' : 'scrollToSection'

  initialize: ->
    @createSubViews()
    @subViews = [@featured, @showcase, @about]
    @render()

  render: ->
    @$el.html(@template())
    @$('#featured').append(@featured.render().$el)
    @$('#showcase').append(@showcase.render().$el)
    @$('#about').append(@about.render().$el)
    @

  createSubViews: ->
    @featured = new BangarangBend.Views.Featured()
    @showcase = new BangarangBend.Views.Showcase()
    @about    = new BangarangBend.Views.About()

  scrollToSection: (event) ->
    event.preventDefault()
    $('#contact').velocity('scroll', { duration: 1000, easing: 'easeOutQuad' })
