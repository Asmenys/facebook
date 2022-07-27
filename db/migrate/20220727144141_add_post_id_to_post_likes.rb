class AddPostIdToPostLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :post_likes, :post_id, :integer
  end
end
