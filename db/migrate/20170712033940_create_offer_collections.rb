class CreateOfferCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_collections do |t|
      t.integer :offer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
