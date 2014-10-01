#= require jquery
#= require jquery_ujs

#= require backbone-rails
#= require turbolinks
#= require bootstrap
#= require cocoon
#= require underscore


# Page base class
class Deck.BasePage extends Backbone.View
  # All pages are attached to the body
  el: document.body

  initialize: (options) ->
    super(options)
