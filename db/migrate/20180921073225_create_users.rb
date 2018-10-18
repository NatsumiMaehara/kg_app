class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.text :email
      t.string :icon
      t.integer :user_level
      t.string :header_background
      t.string :blog_open
      t.text :password

      t.timestamps
    end
  end
end
