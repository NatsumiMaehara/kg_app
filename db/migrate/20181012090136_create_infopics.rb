class CreateInfopics < ActiveRecord::Migration[5.2]
  def change
    create_table :infopics do |t|
      t.integer :info_id
      t.string :pic

      t.timestamps
    end
  end
end
