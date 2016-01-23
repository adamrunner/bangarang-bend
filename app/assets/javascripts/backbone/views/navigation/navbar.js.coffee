BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View
  template: JST["backbone/templates/navigation/navbar"]

  events:
    'click .nav-button' : 'mobileNav'

  initialize: ->
    @navCollapse = $('.nav-wrap')
    @listenTo Backbone, 'navClose', @mobileNav
    @render()
    @menuBtn = @$('#menu-btn')

  render: ->
    @$el.html(@template())
    @

  mobileNav: ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration: 250, "easeOutCirc"
      @menuBtn.removeClass('active')
      window.BangarangBend.menuToggled = false
    else
      @navCollapse.velocity {translateX: ["0%", "-100%"]}, duration: 250, "easeInCirc"
      @menuBtn.addClass('active')
      window.BangarangBend.menuToggled = true
