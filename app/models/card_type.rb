class CardType < ActiveRecord::Base
  has_and_belongs_to_many :cards

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.identity
    where(name: ["Neutral", "Anarch", "Criminal", "Shaper", "Haas-Bioroid", "Jinteki", "Weyland Consortium", "NBN"])
  end

  def self.not_identity
    where.not(name: ["Neutral", "Anarch", "Criminal", "Shaper", "Haas-Bioroid", "Jinteki", "Weyland Consortium", "NBN"])
  end
end

