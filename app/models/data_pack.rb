class DataPack < ActiveRecord::Base
  has_many :cards
  mount_uploader :box, BoxUploader

  extend FriendlyId
  friendly_id :name, use: :slugged
end
