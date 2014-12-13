class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :message
      t.integer :contact_id

      t.timestamps
    end
    add_index :sms,   [:contact_id, :created_at]
  end
end
