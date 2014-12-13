class RenameStoresToMessages < ActiveRecord::Migration
  def change
    rename_table :stores, :messages
  end
end
