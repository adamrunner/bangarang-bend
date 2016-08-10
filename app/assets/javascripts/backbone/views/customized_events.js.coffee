BangarangBend.Views ||= {}

class BangarangBend.Views.CustomizedEvents extends Backbone.View
  template: JST["backbone/templates/customized_events"]

  id: 'customized-events-block'
  className: 'card card-block shadow hidden'

  initialize: ->
    @page = BangarangBend.pages.findWhere(name: "events")
    Backbone.trigger('domchange:title', @page.titleName())
    @render()

  render: ->
    @$el.html(@template(page: @page, event_items: @collection))
    @$("#copy-text").html(@page.get("copy_text"))
    @
