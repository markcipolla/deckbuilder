class AddIdentityCardIdToDeck < ActiveRecord::Migration
  def change
    change_table :decks do |t|
      t.references :identity_card
    end
  end
end
