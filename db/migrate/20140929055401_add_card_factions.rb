class AddCardFactions < ActiveRecord::Migration
  def change
    # Add Corp cards
    ["Agenda", "Asset", "ICE", "Operation", "Upgrade"].each do |card_type|
      CardType.where(name: card_type).first.cards.each do |card|
        card.update_attributes(faction: Faction.where(name: "Corporation").first)
      end
    end

    # Add Runner cards
    ["Event", "Hardware", "Program", "Resource"].each do |card_type|
      CardType.where(name: card_type).first.cards.each do |card|
        card.update_attributes(faction: Faction.where(name: "Runner").first)
      end
    end
  end
end


