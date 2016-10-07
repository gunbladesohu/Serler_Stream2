class RemovePasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Password, :string
  end
end
