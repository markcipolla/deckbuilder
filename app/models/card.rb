class Card < ActiveRecord::Base
  belongs_to :faction
  belongs_to :identity
  belongs_to :data_pack
  has_many :decks, through: :deck_cards
  has_many :deck_cards
  has_and_belongs_to_many :card_types

  extend FriendlyId
  friendly_id :name, use: :slugged

  def card_image
    image_id.present? ? "cards/#{image_id}.png" : "cards/blank.png"
  end

  def formatted_description
    text = description.gsub("[Click]", "<span class='icon icon-click'></span>")
    text = text.gsub("[Subroutine]", "<span class='icon icon-subroutine'></span>")
    text = text.gsub("[Credits]", "<span class='icon icon-credit'></span>")
    text = text.gsub("[Memory Unit]", "<span class='icon icon-mu'></span>")
    text = text.gsub("[Recurring Credits]", "<span class='icon icon-recurring-credit'></span>")
    text = text.gsub("[Link]", "<span class='icon icon-link'></span>")
    text.html_safe
  end
end
