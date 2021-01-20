class RenameUserIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :userId, :user_id
  end
end
