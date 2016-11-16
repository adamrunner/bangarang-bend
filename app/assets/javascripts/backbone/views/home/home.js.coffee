BangarangBend.Views.Home ||= {}

class BangarangBend.Views.Home extends Backbone.View
  template: JST["backbone/templates/home/home"]

  className: 'page-view hidden'
  id: 'home-block'

  events: ->
    'click #contact-btn' : 'scrollToSection'

  initialize: ->
    Backbone.trigger('domchange:title', 'BangarangBend')
    @createSubViews()
    @subViews = [@landing, @address, @featured, @showcase, @about, @instagramImages]

  render: ->
    @$el.html(@template())
    @$('#landing').html(@landing.render().$el)
    @$('#address').html(@address.render().$el)
    @$('#featured').html(@featured.render().$el)
    @$('#showcase').html(@showcase.render().$el)
    @$('#about').html(@about.render().$el)
    @$('#instagram-images').html(@instagramImages.render().$el)
    @

  createSubViews: ->
    @landing         = new BangarangBend.Views.Landing()
    @address         = new BangarangBend.Views.Address()
    @featured        = new BangarangBend.Views.Featured()
    @showcase        = new BangarangBend.Views.Showcase()
    @about           = new BangarangBend.Views.About()
    @instagramImages = new BangarangBend.Views.InstagramImages()

  scrollToSection: (event) ->
    event.preventDefault()
    $('#contact').velocity('scroll', { duration: 1500, easing: 'easeOutQuad' })
