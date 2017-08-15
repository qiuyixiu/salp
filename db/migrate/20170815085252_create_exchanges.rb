class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.string :title
      t.string :image
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
