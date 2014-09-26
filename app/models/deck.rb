class Deck < ActiveRecord::Base
  belongs_to :faction
  belongs_to :user
  has_and_belongs_to_many :cards
  has_one :identity
end
