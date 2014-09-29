class AddFactions < ActiveRecord::Migration
  def change
    add_column :factions, :slug, :string
    add_index :factions, :slug, unique: true

    ["Runner", "Corporation"].each do |faction|
      Faction.create!(name: faction)
    end
  end
end
