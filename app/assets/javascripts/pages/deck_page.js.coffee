#= require jquery
#= require pages/base_page

class Deck.DeckPage extends Deck.BasePage
  initialize: (options) ->
    $(".identity i").tooltip()
    $(".card-types i").tooltip()
    super(options)
