class AddUniqueSlugToDataPack < ActiveRecord::Migration
  def change
    add_column :data_packs, :slug, :string
    add_index :data_packs, :slug, unique: true
  end
end
