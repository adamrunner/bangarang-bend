BangarangBend.Views.Showcase ||= {}

class BangarangBend.Views.Showcase extends Backbone.View
  template: JST["backbone/templates/home/showcase"]

  className: 'showcase-inner'

  events:
    'mouseenter .showcase-item' : 'trackCursor'
    'mouseleave .showcase-item' : 'animateOverlayOut'

  initialize: ->
    @pages = BangarangBend.pages

  render: ->
    @$el.html(@template(pages: @pages))
    @

  animateOverlayIn: (event, btl, overlay) ->
    overlayIn = [
      { e: $(overlay), p: {width: '100%'}, o: {duration: 125} },
      { e: $(overlay), p: {height: '100%', fontSize: ['1.5em', '1.5em'], color: '#C34C3B'}, o: {duration: 125} }
    ]
    $(overlay).velocity("stop")
    $.Velocity.RunSequence(overlayIn)
    $(btl).velocity("stop").velocity({opacity: '1'}, {duration: 150, delay: 250})

  animateOverlayOut: (event) ->
    clearInterval(@interval)
    $(event.currentTarget).off("mousemove")

    btl     = $(event.currentTarget).children('.btl')
    overlay = $(event.currentTarget).children('.showcase-link-name')
    overlayOut = [
      { e: $(overlay), p: {height: @overlayHeight, fontSize: '1em', color: '#CEC7C6'}, o: {duration: 125} },
      { e: $(overlay), p: {width: '37%'}, o: {duration: 125} }
    ]
    $(overlay).velocity("stop")
    $(btl).velocity("stop").velocity({opacity: '0'}, {duration: 0})
    $.Velocity.RunSequence(overlayOut)

  getDifference: (prev, current) ->
    difX = Math.abs(prev[0] - current[0])
    difY = Math.abs(prev[1] - current[1])
    return [difX, difY]

  trackCursor: (e) ->
    target       = $(e.currentTarget)
    btl          = target.children('.btl')
    overlay      = target.children('.showcase-link-name')
    parentOffset = $(e.currentTarget).offset()

    if @overlayHeight == undefined
      @overlayHeight = overlay.css('height')

    $(e.currentTarget).mousemove event, =>
      @posX = event.pageX - parentOffset.left
      @posY = event.pageY - parentOffset.top

    @interval = setInterval(( =>
      if @prevPos != undefined
        currentPos = [@posX, @posY]
        diff = @getDifference(@prevPos, currentPos)
        @prevPos = currentPos
      else
        @prevPos = [@posX, @posY]

      if diff[0] <= 2 && diff[1] <= 2
        clearInterval(@interval)
        $(e.currentTarget).off("mousemove")
        @animateOverlayIn(e, btl, overlay)

    ), 100)
