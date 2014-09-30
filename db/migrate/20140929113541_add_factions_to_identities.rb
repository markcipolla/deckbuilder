class AddFactionsToIdentities < ActiveRecord::Migration
  def change
    ["Identity"].each do |card_type|
      CardType.where(name: card_type).first.cards.each do |card|

        if card.card_types.collect(&:name).include? "Anarch"
          card.update_attributes(faction: Faction.where(name: "Runner").first)
        end

        if card.card_types.collect(&:name).include? "Criminal"
          card.update_attributes(faction: Faction.where(name: "Runner").first)
        end

        if card.card_types.collect(&:name).include? "Shaper"
          card.update_attributes(faction: Faction.where(name: "Runner").first)
        end

        if card.card_types.collect(&:name).include? "Haas-Bioroid"
          card.update_attributes(faction: Faction.where(name: "Corporation").first)
        end

        if card.card_types.collect(&:name).include? "Jinteki"
          card.update_attributes(faction: Faction.where(name: "Corporation").first)
        end

        if card.card_types.collect(&:name).include? "Weyland Consortium"
          card.update_attributes(faction: Faction.where(name: "Corporation").first)
        end

        if card.card_types.collect(&:name).include? "NBN"
          card.update_attributes(faction: Faction.where(name: "Corporation").first)
        end
      end
    end
  end
end
