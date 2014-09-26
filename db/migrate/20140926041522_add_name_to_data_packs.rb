class AddNameToDataPacks < ActiveRecord::Migration
  def change
    add_column :data_packs, :name, :string
  end
end
