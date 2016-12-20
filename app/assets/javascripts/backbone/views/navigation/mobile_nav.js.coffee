BangarangBend.Views.MobileNav ||= {}

class BangarangBend.Views.MobileNav extends Backbone.View

  events:
    'click .nav-close' : 'navClick'

  # initialize: ->

  navClick: (event) ->
    Backbone.trigger "navClose", {scroll: true}
