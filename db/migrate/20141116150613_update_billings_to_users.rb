class UpdateBillingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :billing_id, :integer
  end
end
