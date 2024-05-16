class CreateAssistants < ActiveRecord::Migration[7.1]
  def change
    create_table :assistants, id: :uuid do |t|
      t.string :name, null: false
      t.string :external_id, null: false

      t.timestamps
    end
  end
end
