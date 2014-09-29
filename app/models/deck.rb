class Deck < ActiveRecord::Base
  belongs_to :faction
  belongs_to :user
  has_and_belongs_to_many :cards
  has_one :identity

  validate :has_one_identity?

  private

  def has_one_identity?
    unless cards.select{ |c| c.card_types.include?(CardType.where(name: "Identity")) }.count == 1
      errors.add(:cards, 'must have an Identity')
    end
  end
end
