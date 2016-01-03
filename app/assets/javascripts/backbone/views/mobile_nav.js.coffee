BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View
  template: JST["backbone/templates/mobile_nav"]

  events:
    'click .nav-button' : 'showNavigation'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  showNavigation: ->
    if @menuToggled == true
      $('#secondary-wrap').velocity {translateX: "-50%"}, {duration: 250}, "easeOutCirc"
      $('#secondary-wrap').removeClass('toggled')
      @menuToggled = false
    else
      $('#secondary-wrap').velocity {translateX: ["0%", "-50%"]}, {duration: 250}, "easeInCirc"
      $('#secondary-wrap').addClass('toggled')
      @menuToggled = true
