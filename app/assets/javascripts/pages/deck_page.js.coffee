#= require jquery
#= require pages/base_page

class Deck.DeckPage extends Deck.BasePage
  events:
    "submit form": "_submitForm"
    "click .card-selection .deck-card .number a": "_changeDeckCardCount"

  numberButtons: _.template """
    <a href="#" class="count">0</a>
    <a href="#" class="count1">1</a>
    <a href="#" class="count2">2</a>
    <a href="#" class="count3">3</a>
  """

  cardList: _.template """
    <tr>
      <td><%= number %></td>
      <td><%= name %></td>
    </tr>
  """

  initialize: (options) ->
    $(".identity i").tooltip()
    $(".card-types i").tooltip()
    @cards = $(".card-selection .deck-card")

    @_buildNumberCounters()
    @_buildCardList()
    super(options)

  _buildCardList: ->
    cardListTable = $(".card-list tbody")
    cardListTable.empty()
    _.map @cards, (card) =>
      number = $(card).children(".number")
      cardCount = number.children(".active").attr("class").split(" ")[0].replace("count", "")

      if cardCount > 0
        cardListTable.append(@cardList(number: cardCount, name: $(card).children(".name").html()))

  _buildNumberCounters: ->
    _.map @cards, (card) =>
      number = $(card).children(".number")
      number.append(@numberButtons())
      cardCount = number.children("input").val()
      number.children("a.count#{cardCount}").addClass("active")

  _changeDeckCardCount: (event) ->
    event.preventDefault()
    $(event.currentTarget).parent().children("a").removeClass("active")
    $(event.currentTarget).addClass("active")
    @_buildCardList()

  _submitForm: (event) ->
    event.preventDefault()
    _.map @cards, (card) =>
      number = $(card).children(".number")
      cardCount = number.children(".active").attr("class").split(" ")[0].replace("count")
      number.children("input").val(cardCount)
    $(event.currentTarget).trigger('submit')
