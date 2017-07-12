class AddIsHiddenToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :is_hidden, :boolean, default: true
  end
end
