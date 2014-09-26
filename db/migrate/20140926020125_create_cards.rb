class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :faction, index: true
      t.references :deck, index: true
      t.string :name
      t.text :description
      t.integer :cost
      t.references :identity, index: true
      t.references :data_pack, index: true

      t.timestamps
    end
  end
end
