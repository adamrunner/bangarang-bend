BangarangBend.Views.BgCarousel ||= {}

class BangarangBend.Views.BgCarousel extends Backbone.View
  template: JST["backbone/templates/bg_carousel"]

  initialize: ->
    @currentSlide = 1
    @numOfSlides = 3
    @render()
    setInterval (=>
      @switchBackground()
      return
    ), 20000

  render: ->
    @$el.html(@template())
    @

  switchBackground: () ->
    if @currentSlide < @numOfSlides
      @nextSlide = @currentSlide + 1
    else if @currentSlide == @numOfSlides
      @nextSlide = 1
    else
      @nextSlide = 2
    @slideSwitch()

  slideSwitch: ->
    @$("#bg_#{@currentSlide}").velocity {opacity: 0}, display: "none", duration: 750, complete: =>
      @$("#bg_#{@currentSlide}").removeClass('active')
      @currentSlide = @nextSlide
      @$("#bg_#{@nextSlide}").velocity {opacity: 1}, display: "block", duration: 750
