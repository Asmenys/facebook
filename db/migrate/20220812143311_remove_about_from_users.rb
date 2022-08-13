class RemoveAboutFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :about, :text
  end
end
