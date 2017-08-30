class AddIsHiddenToExchange < ActiveRecord::Migration[5.0]
  def change
    add_column :exchanges, :is_hidden, :boolean, default: true
  end
end
