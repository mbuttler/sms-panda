class RemoveBalanceAndChargesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :balance, :decimal
    remove_column :users, :charges, :decimal
  end
end
