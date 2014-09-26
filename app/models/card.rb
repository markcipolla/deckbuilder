class Card < ActiveRecord::Base
  belongs_to :faction
  belongs_to :deck
  belongs_to :identity
  belongs_to :data_pack
end
