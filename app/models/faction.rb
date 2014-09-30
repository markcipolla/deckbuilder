class Faction < ActiveRecord::Base
  has_many :identities
  has_many :cards

  extend FriendlyId
  friendly_id :name, use: :slugged
end
