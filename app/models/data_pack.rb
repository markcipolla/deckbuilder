class DataPack < ActiveRecord::Base
  has_many :cards
   mount_uploader :box, BoxUploader
end
