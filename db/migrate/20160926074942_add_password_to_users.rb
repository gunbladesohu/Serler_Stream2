class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Password, :string
  end
end
