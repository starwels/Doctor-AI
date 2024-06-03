class CreateClinicalCases < ActiveRecord::Migration[7.1]
  def change
    create_table :clinical_cases, id: :uuid do |t|
      t.jsonb :patient_data
      t.references :chat, type: :uuid, null: true, foreign_key: true

      t.timestamps
    end
  end
end
