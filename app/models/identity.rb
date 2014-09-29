class Identity < ActiveRecord::Base
  belongs_to :faction
  has_many :cards

  extend FriendlyId
  friendly_id :name, use: :slugged
end
