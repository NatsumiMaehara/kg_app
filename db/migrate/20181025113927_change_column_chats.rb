class ChangeColumnChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :user_id
    add_column :chats, :sender_id, :integer
    add_column :chats, :receiver_id, :integer
  end
end
