class ChangeDatatypeForContacts < ActiveRecord::Migration
  def change
    change_column :contacts, :number, :decimal
    rename_column :contacts, :number, :phone
  end
end
