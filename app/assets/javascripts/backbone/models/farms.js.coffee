class BangarangBend.Models.Farm extends Backbone.Model

  isEven: (value) ->
    if value%2 == 0
      return true
    else
      return false

class BangarangBend.Collections.Farms extends Backbone.Collection
  model: BangarangBend.Models.Farm

  url: '/farms'
