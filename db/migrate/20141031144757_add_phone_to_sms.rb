class AddPhoneToSms < ActiveRecord::Migration
  def change
    add_column :sms, :phone, :decimal
  end
end
