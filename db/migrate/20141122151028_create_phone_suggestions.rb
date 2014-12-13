class CreatePhoneSuggestions < ActiveRecord::Migration
  def change
    create_table :phone_suggestions do |t|
      t.string :phone
      t.integer :popularity

      t.timestamps
    end
  end
end
