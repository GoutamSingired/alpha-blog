class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user, :username
  end
end
