BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View
  template: JST["backbone/templates/navigation/navbar"]

  events:
    'click #nav-btn'        : 'mobileNav'
    'click #nav-brand'      : 'mobileNavCheck'
    'click .dropdown-item'  : 'closeDropdown'
    'click .navbar-btn'     : 'closeDropdown'

  initialize: ->
    @pages = BangarangBend.pages
    @menus = BangarangBend.menus
    @body = $('body')
    @navCollapse = $('#mobile-nav')
    @listenTo Backbone, 'navClose', @mobileNav
    @render()

  render: ->
    @$el.html(@template(menus: @menus, pages: @pages))
    @

  mobileNav: (options) ->
    if BangarangBend.menuToggled == true
      $('#nav-btn').addClass('bt-bars')
      $('#nav-btn').removeClass('bt-times')
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:500, easing:"easeInOutQuart", complete: =>
        if options.scroll == true
          @scrollTop()
        window.BangarangBend.menuToggled = false
    else
      $('#nav-btn').addClass('bt-times')
      $('#nav-btn').removeClass('bt-bars')
      @navCollapse.velocity {translateX: ["0%", "-100%"]}, duration: 500, easing:"easeInOutQuart"
      window.BangarangBend.menuToggled = true

  mobileNavCheck: ->
    @scrollTop()
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:500, easing:"easeInOutQuart"
      window.BangarangBend.menuToggled = false
      return true

  scrollContent: ->
    $('#content').velocity('scroll', {offset: "-70px", duration: 700})

  scrollTop: ->
    @body.bind 'scroll mousedown DOMMouseScroll mousewheel keyup touchstart', (e) =>
      if e.which > 0 or e.type == 'mousedown' or e.type == 'mousewheel' or e.type == 'touchstart'
        @body.velocity('stop').unbind 'scroll mousedown DOMMouseScroll mousewheel keyup touchstart'

    @body.velocity 'scroll', {duration: 700, delay: 300}

  closeDropdown: (event) ->
    @scrollTop()
    @$('#nav-dropdown').removeClass('open')
