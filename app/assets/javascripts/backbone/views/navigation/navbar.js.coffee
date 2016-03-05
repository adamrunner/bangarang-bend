BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View
  template: JST["backbone/templates/navigation/navbar"]

  events:
    'click #nav-btn'   : 'mobileNav'
    'click #nav-brand' : 'scroll'

  initialize: ->
    @navCollapse = $('#mobile-nav')
    @listenTo Backbone, 'navClose', @mobileNav
    @render()

  render: ->
    @$el.html(@template())
    @

  mobileNav: ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:300, delay:400, easing:"easeOutExpo", complete: ->
        Backbone.trigger "navClosed"
        window.BangarangBend.menuToggled = false
    else
      @navCollapse.velocity {translateX: ["0%", "-100%"]}, duration: 300, "easeInExpo"
      window.BangarangBend.menuToggled = true

  scroll: ->
    $('#landing').velocity('scroll', {duration: 1000, easing: 'easeInQuad' })
