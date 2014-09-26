class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :deck, index: true
      t.references :faction, index: true

      t.timestamps
    end
  end
end
