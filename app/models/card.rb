class Card < ActiveRecord::Base
  belongs_to :faction
  belongs_to :deck
  belongs_to :identity
  belongs_to :data_pack
  has_and_belongs_to_many :decks
  has_and_belongs_to_many :card_types

  extend FriendlyId
  friendly_id :name, use: :slugged

  def card_image
    image_id.present? ? "cards/#{image_id}.png" : "cards/blank.png"
  end

  def formatted_description
    text = description.gsub("[Click]", "<span class='click'>[Click]</span>")
    text = text.("[Subroutine]", "<span class='subroutine'>[Subroutine]</span>")
    text = text.("[Credits]", "<span class='credits'>[Credits]</span>")
  end
end
