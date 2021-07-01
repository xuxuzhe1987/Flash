class CreateUserDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_decks do |t|
      t.integer :status
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
