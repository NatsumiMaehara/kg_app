class CreateEventpics < ActiveRecord::Migration[5.2]
  def change
    create_table :eventpics do |t|
      t.integer :event_id
      t.string :pic

      t.timestamps
    end
  end
end
