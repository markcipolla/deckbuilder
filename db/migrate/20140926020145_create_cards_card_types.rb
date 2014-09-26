class CreateCardsCardTypes < ActiveRecord::Migration
  def change
    create_table :cards_card_types do |t|
      t.belongs_to :card, index: true
      t.belongs_to :card_type, index: true
    end
  end
end
