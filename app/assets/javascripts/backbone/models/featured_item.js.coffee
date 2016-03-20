class BangarangBend.Models.FeaturedItem extends Backbone.Model

  isLinkOut: ->
    if @get('link_url').match(/^http/) != null
      return true
    else
      return false

  tab: ->
    if @isLinkOut()
      'target=' + '_blank'
    else
      ''

  createLink: ->
    if @isLinkOut()
      url = "#{@get('link_url')}"
    else
      url = "/#{@get('link_url')}"

    if @get('link_url')
      'href=' + url
    else
      ''

  createClass: ->
    if @get('link_url')
      'class=' + 'featured-item-card'
    else
      'class=' + 'featured-item-card-no-link'

  linkTag: ->
    "#{@createLink()} #{@createClass()} #{@tab()}"

class BangarangBend.Collections.FeaturedItems extends Backbone.Collection
  model: BangarangBend.Models.FeaturedItem
