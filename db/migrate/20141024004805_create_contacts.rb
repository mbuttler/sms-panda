class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
