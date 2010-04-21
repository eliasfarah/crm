class ChangeUserForAuthologic < ActiveRecord::Migration
  def self.up
    rename_column :users, :login, :username
    rename_column :users, :password, :crypted_password
    add_column    :users, :password_salt, :string
    add_column    :users, :persistence_token, :string
    add_column    :users, :email, :string
  end

  def self.down
    rename_column :users, :username, :login
    rename_column :users, :crypted_password,:password 
    remove_column :users, :password_salt, :string
    remove_column :users, :persistence_token, :string
    remove_column :users, :email, :string
  end
end
