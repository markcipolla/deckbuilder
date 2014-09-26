class UpdateAllDataPacks < ActiveRecord::Migration
  def change
    DataPack.find_each(&:save)
  end
end
