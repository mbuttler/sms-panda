class ChangePhoneFormat2InPhoneSuggestions < ActiveRecord::Migration
  def change
    change_column :phone_suggestions, :phone, :string 
  end
end
