class AddUserToDecks < ActiveRecord::Migration[6.0]
  def change
    add_reference :decks, :user, null: false, foreign_key: true
  end
end
