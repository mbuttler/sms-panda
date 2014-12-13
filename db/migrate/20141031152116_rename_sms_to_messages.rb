class RenameSmsToMessages < ActiveRecord::Migration
  def change
    rename_table :sms, :stores
  end
end
