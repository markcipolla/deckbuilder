#= require jquery
#= require jquery_ujs

#= require backbone-rails
#= require turbolinks
#= require bootstrap
#= require cocoon
#= require underscore
#= require bootstrap-sprockets


# Page base class
class Deck.BasePage extends Backbone.View
  # All pages are attached to the body
  el: document.body

  initialize: (options) ->
    super(options)
