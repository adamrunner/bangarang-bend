BangarangBend.Views.Showcase ||= {}

class BangarangBend.Views.Showcase extends Backbone.View
  template: JST["backbone/templates/home/showcase"]

  className: 'showcase-inner'

  events:
    'mouseenter .showcase-item' : 'trackCursor'
    'mouseleave .showcase-item' : 'animateOverlayOut'

  initialize: ->
    @pages = BangarangBend.pages
    @registerAnimations()

  render: ->
    @$el.html(@template(pages: @pages))
    @

  animateOverlayIn: (btl, overlay) ->
    $(overlay).velocity('overlayShow')
    $(btl).velocity("stop").velocity({opacity: '1'}, {duration: 150, delay: 250})

  animateOverlayOut: (event) ->
    $(event.currentTarget).off("mousemove")
    clearInterval(@interval)

    btl     = $(event.currentTarget).children('.btl')
    overlay = $(event.currentTarget).children('.showcase-link-name')

    $(overlay).velocity("overlayShrink")
    $(btl).velocity("stop").velocity({opacity: '0'}, {duration: 0})

  getDifference: (prev, current) ->
    difX = Math.abs(prev[0] - current[0])
    difY = Math.abs(prev[1] - current[1])
    return [difX, difY]

  trackCursor: (e) ->
    target       = $(e.currentTarget)
    btl          = target.children('.btl')
    overlay      = target.children('.showcase-link-name')
    parentOffset = target.offset()
    # @overlayWidth  = overlay.css('width')

    # if @overlayHeight == undefined
    #   @overlayHeight = overlay.css('height')

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

  registerAnimations: ->
    $.Velocity.RegisterEffect('overlayShow', {
    defaultDuration: 250,
    calls: [
        [ { width:  '100%', borderColor: '#333' }, 0.5 ],
        [ { height: '100%', fontSize: '+=0.5em', color: '#C34C3B'}, 0.5 ]
    ]
    })
    .RegisterEffect('overlayShrink', {
    defaultDuration: 250,
    calls: [
        [ { height: '3.5rem', fontSize: '1em', borderColor: '#C34C3B'}, 0.5 ],
        [ { width:  '37%', color: '#CEC7C6' }, 0.5 ]
    ]
    })
