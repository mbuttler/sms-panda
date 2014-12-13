class FixIntegerType < ActiveRecord::Migration
  def change
    change_column :sms, :contact_id, :decimal
  end
end
