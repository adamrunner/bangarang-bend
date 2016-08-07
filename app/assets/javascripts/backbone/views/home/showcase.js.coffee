BangarangBend.Views.Showcase ||= {}

class BangarangBend.Views.Showcase extends Backbone.View
  template: JST["backbone/templates/home/showcase"]

  className: 'showcase-inner'

  #NOTE custom Velocity animations animateOverlayIn animateOverlayOut are defined in bangarand_bend.js.coffee
  events:
    'mouseenter .showcase-item' : 'trackCursor'
    'mouseleave .showcase-item' : 'animateOverlayOut'

  initialize: ->
    @pages = BangarangBend.pages

  render: ->
    @$el.html(@template(pages: @pages))
    @

  animateOverlayIn: (btl, overlay) ->
    $(overlay).velocity('overlayShow')
    $(btl).velocity("stop").velocity({opacity: '1'}, {duration: 150, delay: 250})

  animateOverlayOut: (event) ->
    $(event.currentTarget).off("mousemove")
    clearInterval(@interval)

    btl     = $(event.currentTarget).find('.btl')
    overlay = $(event.currentTarget).find('.showcase-link-name')

    $(overlay).velocity("overlayShrink")
    $(btl).velocity("stop").velocity({opacity: '0'}, {duration: 0})

  getDifference: (prev, current) ->
    difX = Math.abs(prev[0] - current[0])
    difY = Math.abs(prev[1] - current[1])
    return [difX, difY]

  trackCursor: (e) ->
    target       = $(e.currentTarget)
    btl          = target.find('.btl')
    overlay      = target.find('.showcase-link-name')
    parentOffset = target.offset()

    target.mousemove (event) =>
      @posX = event.pageX - (parentOffset.left)
      @posY = event.pageY - (parentOffset.top)

    @interval = setInterval(( =>
      if @prevPos != undefined
        currentPos = [Math.round(@posX), Math.round(@posY)]
        diff = @getDifference(@prevPos, currentPos)
        @prevPos = currentPos
      else
        @prevPos = [Math.round(@posX), Math.round(@posY)]

      if diff != undefined && diff[0] <= 2 && diff[1] <= 2
        target.off("mousemove")
        clearInterval(@interval)
        @animateOverlayIn(btl, overlay)
    ), 100)
