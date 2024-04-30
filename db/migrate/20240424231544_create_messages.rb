class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :body, null: false
      t.integer :origin, null: false
      t.references :chat, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
