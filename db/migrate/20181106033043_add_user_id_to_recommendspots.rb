class AddUserIdToRecommendspots < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendspots, :user_id, :integer
  end
end
