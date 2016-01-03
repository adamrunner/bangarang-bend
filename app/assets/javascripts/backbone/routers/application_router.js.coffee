class BangarangBend.Routers.ApplicationRouter extends Backbone.Router
  initialize: () ->
    @slideNum = 1
    setInterval (=>
      @switchBackground()
      return
    ), 20000

  routes:
    '' : 'home'

  home: ->
    home     = new BangarangBend.Views.Home(el: '#home-container')
    featured = new BangarangBend.Views.Featured(el: '#featured-container')

  switchBackground: () ->
    if @slideNum < 3
      @slideNum++
      @fadeInOut()
    else if @slideNum == 3
      @slideNum = 1
      @fadeInOut()
    else
      @slideNum = 2
      @fadeInOut()

  fadeInOut: ->
    console.log(@slideNum)
    $('#img-fade').velocity {opacity: 0}, duration: 1000, complete: =>
      $('#img-fade').attr('src', "/images/background_0#{@slideNum}.jpg")
      $('#img-fade').velocity({opacity: 1}, {duration: 1000})
