class CreateDataPacks < ActiveRecord::Migration
  def change
    create_table :data_packs do |t|
      t.date :release_date

      t.timestamps
    end
  end
end
