class AddContactIdToSms < ActiveRecord::Migration
  def change
    add_column :sms, :contact_id, :integer
  end

end
