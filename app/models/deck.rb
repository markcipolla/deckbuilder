class Deck < ActiveRecord::Base
  belongs_to :faction
  belongs_to :user

  has_many :cards, through: :deck_cards
  has_many :deck_cards, dependent: :destroy
  accepts_nested_attributes_for :deck_cards, reject_if: :all_blank, allow_destroy: true

  has_one :identity_card

  validates :identity_card_id, presence: true

end
