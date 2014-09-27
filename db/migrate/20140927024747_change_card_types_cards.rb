class ChangeCardTypesCards < ActiveRecord::Migration
  def change
    drop_table :cards_card_types
    create_table :card_types_cards do |t|
      t.belongs_to :card_type, index: true
      t.belongs_to :card, index: true
    end
  end
end
