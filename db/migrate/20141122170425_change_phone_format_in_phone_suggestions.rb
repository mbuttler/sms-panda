class ChangePhoneFormatInPhoneSuggestions < ActiveRecord::Migration
  def change
    change_column :phone_suggestions, :phone,  'decimal USING CAST(phone AS decimal)' 
  end
end
