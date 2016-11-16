BangarangBend.Views.InstagramImages ||= {}

class BangarangBend.Views.InstagramImages extends Backbone.View
  template: JST["backbone/templates/home/instagram_images"]

  className: 'inner'

  events: ->
    # 'click #contact-btn'      : 'scrollToSection'

  initialize: ->
    @collection = BangarangBend.instagramImages

  render: ->
    @$el.html(@template(instagram_images: @collection))
    @
