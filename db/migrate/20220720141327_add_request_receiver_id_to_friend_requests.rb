class AddRequestReceiverIdToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :request_receiver_id, :integer
  end
end
