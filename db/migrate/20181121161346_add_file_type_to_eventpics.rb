class AddFileTypeToEventpics < ActiveRecord::Migration[5.2]
  def change
    add_column :eventpics, :file_type, :string
  end
end
