BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View

  events:
    'click #nav-btn'        : 'mobileNav'
    'click #nav-brand'      : 'mobileNavCheck'
    'click .dropdown-item'  : 'closeDropdown'
    'click .navbar-btn'     : 'closeDropdown'

  initialize: ->
    @position    = null
    @pages       = BangarangBend.pages
    @menus       = BangarangBend.menus
    @body        = $('body')
    @navCollapse = $('#mobile-nav')
    @listenTo Backbone, 'navClose', @mobileNav
    @navBtn = $('#nav-btn')

  mobileNav: (options) ->
    if BangarangBend.menuToggled == true
      @navBtn.addClass('bt-bars')
      @navBtn.removeClass('bt-times')
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:500, easing:"easeInOutQuart", complete: =>
        window.BangarangBend.menuToggled = false
    else
      @navBtn.addClass('bt-times')
      @navBtn.removeClass('bt-bars')
      @navCollapse.velocity {translateX: ["0%", "-100%"]}, duration: 500, easing:"easeInOutQuart"
      window.BangarangBend.menuToggled = true

  mobileNavCheck: ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:500, easing:"easeInOutQuart"
      window.BangarangBend.menuToggled = false
      return true

  closeDropdown: (event) ->
    @$('#nav-dropdown').removeClass('open')
