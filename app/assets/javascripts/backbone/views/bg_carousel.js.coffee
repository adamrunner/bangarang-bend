BangarangBend.Views.BgCarousel ||= {}

class BangarangBend.Views.BgCarousel extends Backbone.View
  template: JST["backbone/templates/bg_carousel"]

  initialize: ->
    @currentSlide = 1
    @numOfSlides = @collection.length
    @render()
    #TODO figure out a way to turn off for mobile
    setInterval (=>
      @switchBackground()
      return
    ), 30000

  render: ->
    @$el.html(@template(images: @collection))
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
