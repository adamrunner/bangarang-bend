BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View
  template: JST["backbone/templates/navigation/navbar"]

  events:
    'click .nav-button' : 'mobileNav'

  initialize: ->
    @navCollapse = $('.mobile-nav-wrap')
    @listenTo Backbone, 'navClose', @mobileNav
    @render()
    @menuBtn = @$('#menu-btn')

  render: ->
    @$el.html(@template())
    @

  mobileNav: ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration: 350, "easeOutCirc"
      @menuBtn.removeClass('active')
      $('#main-wrap').velocity {translateX: ["0%", "100%"]}, duration: 350, "easeInCirc"
      window.BangarangBend.menuToggled = false
    else
      @navCollapse.velocity {translateX: ["0%", "-100%"]}, duration: 350, "easeInCirc"
      @menuBtn.addClass('active')
      $('#main-wrap').velocity {translateX: ["100%", "0%"]}, duration: 450, "easeOutCirc"
      window.BangarangBend.menuToggled = true
