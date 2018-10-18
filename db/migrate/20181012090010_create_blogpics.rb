class CreateBlogpics < ActiveRecord::Migration[5.2]
  def change
    create_table :blogpics do |t|
      t.integer :blog_id
      t.string :pic

      t.timestamps
    end
  end
end
