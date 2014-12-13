class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :user_id
      t.decimal :credits, :default => 0.0
      t.decimal :charges, :default => 0.0
      t.decimal :balance, :default => 0.0

      t.timestamps
    end
  end
end
