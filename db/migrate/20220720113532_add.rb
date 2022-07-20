class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :friendship_master_id, :integer
  end
end
