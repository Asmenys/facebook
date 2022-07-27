class AddLikerIdTypeToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :liker_id, :integer
  end
end
