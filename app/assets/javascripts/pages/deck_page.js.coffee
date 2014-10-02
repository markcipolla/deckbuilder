#= require jquery
#= require pages/base_page

class Deck.DeckPage extends Deck.BasePage
  events:
    "submit form": "_submitForm"
    "click .card-selection .deck-card .number a": "_changeDeckCardCount"
    "click .card-toggles button": "_toggleCardType"
    "change .selected-identity select": "_updateIdentityCard"

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
    @_showIdentityAgendas()
    @_buildCardList()
    @_setCardImage()

    super(options)

  _updateIdentityCard: (event) ->
    @_buildCardList()
    @_setCardImage()

  _showIdentityAgendas: ->
    _.map @cards, (card) =>
      if $(card).hasClass("agenda")
        unless $(card).data("identitySlug") == $(".selected-identity select option:selected").data("identity_slug") || $(card).data("identitySlug") == "neutral"
          $(card).children(".number").children(".count").trigger("click")
          $(card).hide()
    @_buildCardList()

  _setCardImage: ->
    identityCard = $(".selected-identity select option:selected")
    $(".card-image img").attr("src", identityCard.data("imageurl"))
    @identity = identityCard.data("identity-slug")
    @maximumInfluence = identityCard.data("max_influence")
    $(".maximum-influence span.maximum").html(@maximumInfluence)
    @cards.show()
    @_showIdentityAgendas()

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
    totalInfluence = 0
    totalAgenda = 0
    _.map @cards, (card) =>

      name = $(card).children(".name").children(".card-description").html()
      content = $(card).children(".name").children(".card-description").data("content")
      cardCount = $(card).children(".number").children(".active").attr("class").split(" ")[0].replace("count", "")
      cardIdentity = $(card).data("identitySlug")
      cardAgenda = parseInt($(card).children(".name").children("span").data("agenda")) || 0
      cardInfluence = parseInt($(card).children(".influence").html()) || 0

      if cardCount > 0
        if cardIdentity != $(".selected-identity select option:selected").data("identity_slug")
          totalInfluence += (cardCount * cardInfluence)
        if cardAgenda > 0

          totalAgenda += (cardCount * cardAgenda)

        totalCount += parseInt(cardCount)
        cardListTable.append(@cardList(
          number: cardCount,
          name: name,
          content: content
        ))

    if totalInfluence > $(".selected-identity select option:selected").data("max_influence")
      $(".maximum-influence span.remaining").removeClass("label-default").addClass("label-danger")
    else
      $(".maximum-influence span.remaining").removeClass("label-danger").addClass("label-default")

    if $(".identity").data("faction") == "corporation"
      if totalAgenda < @_minAgendaRequired(totalCount) || totalAgenda > @_maxAgendaRequired(totalCount)
        $(".agenda-required span.agenda").removeClass("label-default").addClass("label-danger")
      else
        $(".agenda-required span.agenda").removeClass("label-danger").addClass("label-default")

      $(".agenda-required span.agenda").html(totalAgenda)
      $(".agenda-required span.min-agenda").html(@_minAgendaRequired(totalCount))
      $(".agenda-required span.max-agenda").html(@_maxAgendaRequired(totalCount))

    $(".maximum-influence span.remaining").html(totalInfluence)
    $(".number-of-cards span").html(totalCount)

  _minAgendaRequired: (count) ->
    if count < 44
      18
    else if count < 50
      20
    else if count < 55
      22
    else if count < 60
      24
    else if count < 65
      26
    else if count < 70
      28
    else if count < 75
      30
    else if count < 80
      32
    else if count < 85
      34
    else if count < 90
      36
    else if count < 95
      38
    else if count < 100
      40

  _maxAgendaRequired: (count) ->
    if count < 44
      19
    else if count < 50
      21
    else if count < 55
      23
    else if count < 60
      25
    else if count < 65
      27
    else if count < 70
      29
    else if count < 75
      31
    else if count < 80
      33
    else if count < 85
      35
    else if count < 90
      37
    else if count < 95
      39
    else if count < 100
      41

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
