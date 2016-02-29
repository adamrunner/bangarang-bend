class BangarangBend.Models.EventItem extends Backbone.Model

class BangarangBend.Collections.EventItems extends Backbone.Collection
  model: BangarangBend.Models.EventItem

  url: '/event_items'
