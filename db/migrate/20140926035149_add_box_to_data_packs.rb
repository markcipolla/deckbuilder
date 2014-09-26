class AddBoxToDataPacks < ActiveRecord::Migration
  def change
    add_column :data_packs, :box, :string
  end
end
