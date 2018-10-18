class CreateRecommendspotpics < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendspotpics do |t|
      t.integer :spot_id
      t.string :pic

      t.timestamps
    end
  end
end
