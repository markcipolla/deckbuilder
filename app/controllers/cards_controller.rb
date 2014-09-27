class CardsController < ApplicationController
  def index
    @cards = Card.all.sort_by &:created_at
  end

  def show
    @card = Card.friendly.find(params[:id])
  end
end
