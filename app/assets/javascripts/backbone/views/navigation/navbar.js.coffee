BangarangBend.Views.Navbar ||= {}

class BangarangBend.Views.Navbar extends Backbone.View
  template: JST["backbone/templates/navigation/navbar"]

  events:
    'click #nav-btn'        : 'mobileNav'
    'click #nav-brand'      : 'mobileNavCheck'

  initialize: ->
    @menus = BangarangBend.menus
    @navCollapse = $('#mobile-nav')
    @listenTo Backbone, 'navClose', @mobileNav
    @render()

  render: ->
    @$el.html(@template(menus: @menus))
    @

  mobileNav: (options) ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:500, easing:"easeInOutQuart", complete: =>
        if options.scroll == true && window.scrollY != 0
          @scrollContent()
        window.BangarangBend.menuToggled = false
    else
      @navCollapse.velocity {translateX: ["0%", "-100%"]}, duration: 500, easing:"easeInOutQuart"
      window.BangarangBend.menuToggled = true

  mobileNavCheck: ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: ["-100%", "0%"]}, duration:500, easing:"easeInOutQuart"
      window.scrollTo(0,0)
      window.BangarangBend.menuToggled = false
    else
      window.scrollTo(0,0)

  scroll: ->
    $('body').velocity('scroll', {duration: 700})

  scrollContent: ->
    $('#content').velocity('scroll', {offset: "-150px", duration: 700})
