class AddUserRefToUserDecks < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_decks, :user, null: false, foreign_key: true
  end
end
