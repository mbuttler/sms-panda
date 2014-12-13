class AddOriginDestinationToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :to, :decimal
    add_column :messages, :from, :decimal
  end
end
