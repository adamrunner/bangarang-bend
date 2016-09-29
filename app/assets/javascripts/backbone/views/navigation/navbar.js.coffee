BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View
  template: JST["backbone/templates/navigation/navbar"]

  events:
    'click #nav-btn'        : 'mobileNav'
    'click #nav-brand'      : 'mobileNavCheck'
    'click .dropdown-item'  : 'closeDropdown'
    'click .navbar-btn'     : 'closeDropdown'

  initialize: ->
    @pages       = BangarangBend.pages
    @menus       = BangarangBend.menus
    @body        = $('body')
    @navCollapse = $('#mobile-nav')
    @listenTo Backbone, 'navClose', @mobileNav
    @listenTo Backbone, 'viewChanged', @scrollTop
    @render()
    @navBtn = $('#nav-btn')

  render: ->
    @$el.html(@template(menus: @menus, pages: @pages))
    @

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

  scrollTop: ->
    @body.bind 'scroll mousedown mousewheel touchstart', (e) =>
      if e.which > 0 or e.type == 'mousedown' or e.type == 'mousewheel' or e.type == 'touchstart'
        @body.velocity('stop').unbind 'scroll mousedown mousewheel touchstart'

    @body.velocity 'scroll', { duration: 1000, offset: "-100px", easing: 'easeOutQuad' }, complete: =>
      @body.velocity('stop').unbind 'scroll mousedown mousewheel touchstart'

  closeDropdown: (event) ->
    @$('#nav-dropdown').removeClass('open')
