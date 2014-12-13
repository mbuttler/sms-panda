class AddUsersToPhoneSuggestions < ActiveRecord::Migration
  def change
    add_column :phone_suggestions, :user_id, :integer
  end
end
