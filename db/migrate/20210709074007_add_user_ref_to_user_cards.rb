class AddUserRefToUserCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_cards, :user, null: false, foreign_key: true
  end
end
