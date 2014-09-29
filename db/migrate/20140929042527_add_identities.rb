class AddIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :name, :string
    add_column :identities, :slug, :string
    remove_column :identities, :deck_id
    add_index :identities, :slug, unique: true

    # Add Neutral Identity
    ["Neutral"].each do |identity|
      Identity.create!(name: identity)
    end

    # Add Runner Identities
    ["Anarch", "Criminal", "Shaper"].each do |identity|
      Identity.create!(name: identity, faction_id: Faction.where(name: "Runner").first.id)
    end

    # Add Corp Identities
    ["Haas-Bioroid", "Jinteki", "Weyland Consortium", "NBN"].each do |identity|
      Identity.create!(name: identity, faction_id: Faction.where(name: "Corporation").first.id)
    end
  end
end
