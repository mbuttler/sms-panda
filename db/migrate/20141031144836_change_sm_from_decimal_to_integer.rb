class ChangeSmFromDecimalToInteger < ActiveRecord::Migration
  def change
    change_column :sms, :contact_id, :integer
  end
end
