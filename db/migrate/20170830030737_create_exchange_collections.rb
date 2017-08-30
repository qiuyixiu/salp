class CreateExchangeCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :exchange_collections do |t|
      t.integer :exchange_id
      t.integer :user_id

      t.timestamps
    end
  end
end
