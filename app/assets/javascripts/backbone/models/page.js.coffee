class BangarangBend.Models.Page extends Backbone.Model

  isEven: (value) ->
    if value%2 == 0
      return true
    else
      return false

  link: () ->
    linkName = @get('link_name')
    name = @get('name')
    if name == 'home'
      return ''
    else
      return linkName.replace(/ /g, '_')

  titleName: ->
    return "BangarangBend - #{@get('link_name').titleize()}"

  splitName: ->
    return @get('link_name').split(' ')

class BangarangBend.Collections.Pages extends Backbone.Collection
  model: BangarangBend.Models.Page
  url: '/pages'

  showcaseLink: (name) ->
    nameSplit = @findWhere(name: name).splitName()
    if nameSplit.length < 2
      nameSplit.unshift("our")
      return nameSplit
    else
      return nameSplit

  linkName: (name) ->
    @findWhere(name: name).link()
