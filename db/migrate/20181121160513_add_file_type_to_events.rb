class AddFileTypeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :file_type, :string
  end
end
