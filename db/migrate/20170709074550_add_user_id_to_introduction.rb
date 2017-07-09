class AddUserIdToIntroduction < ActiveRecord::Migration[5.0]
  def change
    add_column :introductions, :user_id, :integer
  end
end
