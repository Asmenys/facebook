class AddCreatorIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :creator_id, :integer
  end
end
