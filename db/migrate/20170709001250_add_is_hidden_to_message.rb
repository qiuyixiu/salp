class AddIsHiddenToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :is_hidden, :boolean, default: true
  end
end
