class CreateRecommendspots < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendspots do |t|
      t.text :user_comment
      t.string :spot_name
      t.text :detail

      t.timestamps
    end
  end
end
