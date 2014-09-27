class AddFeaturesToCards < ActiveRecord::Migration
  def change
    add_column :cards, :max_influence, :integer
    add_column :cards, :deck_minimum_cards, :integer
    add_column :cards, :influence, :integer
    add_column :cards, :strength, :integer
    add_column :cards, :memory_units, :integer
    add_column :cards, :advancement_cost, :integer
    add_column :cards, :agenda_point, :integer
    add_column :cards, :trash_cost, :integer
    add_column :cards, :link, :integer
    add_column :cards, :image_id, :string
  end
end
