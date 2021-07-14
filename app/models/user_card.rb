class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
  belongs_to :user_deck
end
