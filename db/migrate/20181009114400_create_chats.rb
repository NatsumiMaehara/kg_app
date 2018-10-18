class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :chat_id
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
