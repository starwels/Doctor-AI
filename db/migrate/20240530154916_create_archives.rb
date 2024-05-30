class CreateArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :archives, id: :uuid do |t|
      t.string :title, null: false
    end
  end
end
