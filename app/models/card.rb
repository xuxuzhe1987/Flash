class Card < ApplicationRecord
  belongs_to :deck
  has_many :user_cards, dependent: :destroy
end
