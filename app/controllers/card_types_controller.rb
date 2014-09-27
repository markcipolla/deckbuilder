class CardTypesController < ApplicationController
  def show
    @type = CardType.friendly.find(params[:id])
  end
end
