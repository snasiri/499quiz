class AddNewFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end
end
