class Card < ActiveRecord::Base
  belongs_to :faction
  belongs_to :deck
  belongs_to :identity
  belongs_to :data_pack
  has_and_belongs_to_many :decks
  has_and_belongs_to_many :card_types
end
