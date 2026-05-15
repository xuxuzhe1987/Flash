class RemoveHintFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :hint, :text
  end
end
