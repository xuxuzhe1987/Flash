class Card < ApplicationRecord
  belongs_to :deck
  has_many :UserCards, dependent: :destroy
end
