class Faction < ActiveRecord::Base
  has_many :identities

  extend FriendlyId
  friendly_id :name, use: :slugged
end
