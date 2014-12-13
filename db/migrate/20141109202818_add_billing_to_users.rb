class AddBillingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, default: 0
    add_column :users, :charges, :decimal, default: 0
  end
end
