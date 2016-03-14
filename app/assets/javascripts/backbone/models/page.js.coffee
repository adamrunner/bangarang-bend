class BangarangBend.Models.Page extends Backbone.Model

  link: () ->
    linkName = @get('link_name')
    name = @get('name')
    if name == 'home'
      return ''
    else
      return linkName.replace(/ /g, '_')

class BangarangBend.Collections.Pages extends Backbone.Collection
  model: BangarangBend.Models.Page
  url: '/pages'
