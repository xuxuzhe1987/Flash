class AddAttachmentToUserDecks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_decks, :attachment, :string
  end
end
