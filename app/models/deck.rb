class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :user_decks, dependent: :destroy
end
