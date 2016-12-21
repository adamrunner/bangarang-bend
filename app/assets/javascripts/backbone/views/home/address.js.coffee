BangarangBend.Views.Address ||= {}

class BangarangBend.Views.Address extends Backbone.View
  template: JST["backbone/templates/home/address"]

  className: 'inner'

  initialize: ->
    @model = BangarangBend.address

  render: ->
    @$el.html(@template(address: @model))
    @
