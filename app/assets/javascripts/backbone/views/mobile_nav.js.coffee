BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/mobile_nav"]

  events:
    'click .nav-button'  : 'showNavigation'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  showNavigation: ->
    if @menuToggled == true
      $('#main').velocity {translateX: "-50%"}, {duration: 250}, "easeOutCirc"
      $('#main').removeClass('toggled')
      @menuToggled = false
    else
      $('#main').velocity {translateX: ["0%", "-50%"]}, {duration: 250}, "easeInCirc"
      $('#main').addClass('toggled')
      @menuToggled = true
