class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.references :faction, index: true
      t.references :user, index: true
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
