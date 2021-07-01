class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :UserDecks, dependent: :destroy
end
