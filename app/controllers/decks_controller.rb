class DecksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @decks = current_user.decks
  end

  def new
    @faction = Faction.find_by_name!(params["faction"])
    @deck = Deck.new(faction: @faction)
    gather_form_requirements
    @deck.deck_cards.build
  end

  def edit
    @deck = Deck.find(params[:id])
    @faction = @deck.faction
    gather_form_requirements
    @deck.deck_cards.build
  end

  def create
    @deck = Deck.new(deck_params)

    if @deck.save!
      @deck.deck_cards.create
      @deck.deck_cards.where(number: nil).destroy_all
      redirect_to decks_path
    end
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.deck_cards.destroy_all
    if @deck.update_attributes!(deck_params)
      @deck.deck_cards.where(number: nil).destroy_all
      redirect_to decks_path
    end
  end

  private

  def gather_form_requirements
    @identities = @faction.cards.select{|c| c.card_types.collect(&:name).include? "Identity"}
    @cards = sort_and_group_cards Card.where(faction: @faction).preload(:card_types)

  end

  def deck_params
    params.require(:deck).permit(:name, :identity_card_id, :deck, :id, :faction_id, deck_cards_attributes: [:card_id, :deck_id, :number, :_destroy])
  end

  def sort_and_group_cards(faction_cards)
    cards = {}
    faction_cards.each do |card|
      ["Agenda", "Asset", "ICE", "Operation", "Upgrade", "Event", "Hardware", "Program", "Resource"].each do |card_type|
        if card.card_types.collect(&:name).include? card_type
          if cards[card_type.downcase.to_sym].present?
            cards[card_type.downcase.to_sym] << card
          else
            cards[card_type.downcase.to_sym] = [card]
          end
        end
      end
    end

    cards
  end
end
