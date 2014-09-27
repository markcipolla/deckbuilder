class AddUniqueSlugtoCardType < ActiveRecord::Migration
  def change
    add_column :card_types, :slug, :string
    add_index :card_types, :slug, unique: true

    CardType.find_each(&:save)
  end
end
