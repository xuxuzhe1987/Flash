class UserDeck < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :user_cards, dependent: :destroy
end
