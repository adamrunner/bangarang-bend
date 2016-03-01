class BangarangBend.Models.CateringMenu extends Backbone.Model
  paramRoot: 'catering_menu'

class BangarangBend.Collections.CateringMenus extends Backbone.Collection
  model: BangarangBend.Models.CateringMenu
  url: '/catering_menus'
