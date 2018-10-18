class RenameFriend < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :follower_id, :follower
    rename_column :friends, :followed_id, :followed
    remove_column :friends, :status
  end
end
