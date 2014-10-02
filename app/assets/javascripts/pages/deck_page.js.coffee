#= require jquery
#= require pages/base_page

class Deck.DeckPage extends Deck.BasePage
  events:
    "submit form": "_submitForm"
    "click .card-selection .deck-card .number a": "_changeDeckCardCount"
    "click .card-toggles button": "_toggleCardType"

  numberButtons: _.template """
    <a href="#" class="count">0</a>
    <a href="#" class="count1">1</a>
    <a href="#" class="count2">2</a>
    <a href="#" class="count3">3</a>
  """

  cardList: _.template """
    <tr>
      <td><%= number %></td>
      <td class="name">
        <span class="card-description" data-toggle="popover" data-content="<%= content %>" title="<%= name %>">
          <%= name %>
        </span>
      </td>
    </tr>
  """

  initialize: (options) ->
    $(".identity i").tooltip()
    $(".card-types i").tooltip()
    $('body').popover({selector: '.card-description', html: true, trigger: "hover"})
    @cards = $(".card-selection .deck-card")

    @_buildNumberCounters()
    @_buildCardList()
    super(options)

  _toggleCardType: (event) ->
    $(event.currentTarget).toggleClass("active")
    cardType = $(event.currentTarget).attr("class").split(" ")[0]
    _.map @cards, (card) =>
      if $(card).hasClass(cardType)
        $(card).toggle()

  _buildCardList: ->
    cardListTable = $(".card-list tbody")
    cardListTable.empty()

    $(".number-of-cards .badge").empty()
    totalCount = 0
    _.map @cards, (card) =>

      name = $(card).children(".name").children(".card-description").html()
      content = $(card).children(".name").children(".card-description").data("content")
      cardCount = $(card).children(".number").children(".active").attr("class").split(" ")[0].replace("count", "")

      if cardCount > 0
        totalCount += parseInt(cardCount)
        cardListTable.append(@cardList(
          number: cardCount,
          name: name,
          content: content
        ))
    $(".number-of-cards .badge").html(totalCount)

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
