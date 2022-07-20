class AddColumnToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :friendship_receiver_id, :integer
  end
end
