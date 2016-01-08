BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/mobile_nav"]

  events:
    'click .nav-button' : 'showNavigation'

  initialize: ->
    @navCollapse = $('#nav-collapse')
    @listenTo Backbone, 'navClose', @showNavigation
    @render()

  render: ->
    @$el.html(@template())
    @

  showNavigation: ->
    if BangarangBend.menuToggled == true
      @navCollapse.velocity {translateX: "-50%"}, {duration: 250}, "easeOutCirc"
      @navCollapse.removeClass('toggled')
      window.BangarangBend.menuToggled = false
    else
      @navCollapse.velocity {translateX: ["0%", "-50%"]}, {duration: 250}, "easeInCirc"
      @navCollapse.addClass('toggled')
      window.BangarangBend.menuToggled = true
