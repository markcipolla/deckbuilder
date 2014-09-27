class AddCards < ActiveRecord::Migration
  def change
    load "#{Rails.root}/lib/card_ingestion.rb"
    CardIngestion.new.run(781)
  end
end
