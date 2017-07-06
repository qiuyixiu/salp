class AddImageToIntroduction < ActiveRecord::Migration[5.0]
  def change
    add_column :introductions, :image, :string
  end
end
