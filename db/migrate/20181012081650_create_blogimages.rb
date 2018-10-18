class CreateBlogimages < ActiveRecord::Migration[5.2]
  def change
    create_table :blogimages do |t|
      t.integer :blog_id
      t.string :pic

      t.timestamps
    end
  end
end
