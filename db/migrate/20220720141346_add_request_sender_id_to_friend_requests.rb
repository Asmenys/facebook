class AddRequestSenderIdToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :request_sender_id, :integer
  end
end
