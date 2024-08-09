class AddStopButtonToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :stop, :boolean, default: false
  end
end
