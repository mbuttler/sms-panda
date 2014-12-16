class UpdateDecimalsEverywhere < ActiveRecord::Migration
  def change
    drop_table :active_admin_comments
    change_column :contacts, :phone, :string 
    change_column :messages, :phone, :string 
    change_column :messages, :to, :string 
    change_column :messages, :from, :string 
    change_column :users, :phone, :string 
  end
end
