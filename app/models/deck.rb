class Deck < ActiveRecord::Base
  belongs_to :faction
  belongs_to :user
end
