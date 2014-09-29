class DecksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @decks = current_user.decks
  end

  def new
    @deck = Deck.new
  end
end
