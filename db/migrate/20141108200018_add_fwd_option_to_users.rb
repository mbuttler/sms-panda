class AddFwdOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_fwd, :boolean, :default => false
  end
end
