class RemoveFileTypeFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :file_type, :string
  end
end
