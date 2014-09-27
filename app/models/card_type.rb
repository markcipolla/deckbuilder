class CardType < ActiveRecord::Base
  has_and_belongs_to_many :cards

  extend FriendlyId
  friendly_id :name, use: :slugged
end
