class CreateAssistantArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :assistant_archives do |t|
      t.references :assistant, type: :uuid, null: false, foreign_key: true
      t.references :archive, type: :uuid, null: false, foreign_key: true
      t.string :external_id
      t.string :vector_store_id

      t.timestamps
    end
  end
end
