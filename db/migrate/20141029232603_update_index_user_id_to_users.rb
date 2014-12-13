class UpdateIndexUserIdToUsers < ActiveRecord::Migration
  def change
    rename_column(:sms, :contact_id, :user_id)
  end
end
