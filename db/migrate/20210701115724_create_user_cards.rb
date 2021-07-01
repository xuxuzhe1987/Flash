class CreateUserCards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cards do |t|
      t.boolean :result
      t.text :answer
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
