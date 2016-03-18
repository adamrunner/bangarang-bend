class BangarangBend.Models.CateringMenu extends Backbone.Model
  link: () ->
    name = @get('name')
    return name.replace(/ /g, '_')

class BangarangBend.Collections.CateringMenus extends Backbone.Collection
  model: BangarangBend.Models.CateringMenu
  url: '/catering_menus'
