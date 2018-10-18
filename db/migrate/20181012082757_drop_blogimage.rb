class DropBlogimage < ActiveRecord::Migration[5.2]
  def change
    drop_table :blogimages;
  end
end
