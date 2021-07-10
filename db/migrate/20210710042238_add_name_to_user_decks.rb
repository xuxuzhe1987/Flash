class AddNameToUserDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_decks, :name, :string
  end
end
