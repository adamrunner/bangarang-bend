class BangarangBend.Models.FeaturedItem extends Backbone.Model

  isLinkOut: ->
    url = @get('link_url')
    if url && url.match(/^[\/]/)
      return false
    else
      return true

  tab: ->
    if @isLinkOut()
      'target=_blank'
    else
      ''

  createLink: ->
    url = @get('link_url')
    if url
      'href=' + url
    else
      ''

  createClass: ->
    if @get('link_url')
      'class=featured-item-card'
    else
      'class=featured-item-card-no-link'

  linkTag: ->
    "#{@createLink()} #{@createClass()} #{@tab()}"

class BangarangBend.Collections.FeaturedItems extends Backbone.Collection
  model: BangarangBend.Models.FeaturedItem
