class BangarangBend.Models.FoodTruckImageRow extends Backbone.Model
  
    isEven: (value) ->
      if value%2 == 0
        return true
      else
        return false

class BangarangBend.Collections.FoodTruckImageRows extends Backbone.Collection
  model: BangarangBend.Models.FoodTruckImageRow
