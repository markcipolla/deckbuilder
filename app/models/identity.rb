class Identity < ActiveRecord::Base
  belongs_to :deck
  belongs_to :faction
end
