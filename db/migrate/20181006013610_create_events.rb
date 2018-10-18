class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.text :target
      t.datetime :event_date
      t.datetime :event_start
      t.text :place

      t.timestamps
    end
  end
end
