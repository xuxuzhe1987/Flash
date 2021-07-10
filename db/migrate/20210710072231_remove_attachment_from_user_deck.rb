class RemoveAttachmentFromUserDeck < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_decks, :attachment, :string
    add_column :decks, :attachment, :string
  end
end
