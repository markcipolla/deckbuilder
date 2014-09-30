class AddDeckCards < ActiveRecord::Migration
  def change
    create_table :deck_cards do |t|
      t.belongs_to :deck
      t.belongs_to :card
      t.integer :number
    end

    add_index :deck_cards, :deck_id
    add_index :deck_cards, :card_id
    add_index :deck_cards, [:deck_id, :card_id], unique: true
  end
end
