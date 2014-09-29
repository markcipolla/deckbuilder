class AddIdentitiesToCards < ActiveRecord::Migration
  def change
    # Add Neutral Identity
    ["Neutral"].each do |identity|
      CardType.where(name: identity).first.cards.each do |card|
        card.update_attributes(identity: Identity.where(name: identity).first)
      end
    end

    # Add Runner Identities
    ["Anarch", "Criminal", "Shaper"].each do |identity|
      CardType.where(name: identity).first.cards.each do |card|
        card.update_attributes(identity: Identity.where(name: identity).first)
      end
    end

    # Add Corp Identities
    ["Haas-Bioroid", "Jinteki", "Weyland Consortium", "NBN"].each do |identity|
      CardType.where(name: identity).first.cards.each do |card|
        card.update_attributes(identity: Identity.where(name: identity).first)
      end
    end
  end
end
