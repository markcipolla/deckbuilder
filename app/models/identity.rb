class Identity < ActiveRecord::Base
  belongs_to :deck
  belongs_to :faction
  has_many :cards
end
