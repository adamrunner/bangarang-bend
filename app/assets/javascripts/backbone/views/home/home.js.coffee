BangarangBend.Views.Home ||= {}

class BangarangBend.Views.Home extends Backbone.View
  template: JST["backbone/templates/home/home"]

  className: 'page-view hidden'
  id: 'home-block'

  events: ->
    'click #contact-btn'     : 'scrollToSection'

  initialize: ->
    @createSubViews()
    @subViews = [@featured, @showcase, @about]
    @subViewEls = [@featured.$el, @showcase.$el, @about.$el]

  render: ->
    @$el.html(@template())
    @$('#featured').html(@featured.render().$el)
    @$('#showcase').html(@showcase.render().$el)
    @$('#about').html(@about.render().$el)
    @

  createSubViews: ->
    @featured = new BangarangBend.Views.Featured()
    @showcase = new BangarangBend.Views.Showcase()
    @about    = new BangarangBend.Views.About()

  scrollToSection: (event) ->
    event.preventDefault()
    $('#contact').velocity('scroll', { duration: 1000, easing: 'easeOutQuad' })
