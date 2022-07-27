class AddLikerIdToPostLike < ActiveRecord::Migration[7.0]
  def change
    add_column :post_likes, :liker_id, :integer
  end
end
