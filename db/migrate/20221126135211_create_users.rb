class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :phone_number
      t.date :date_of_birth
      t.string :clubs
      t.string :metro
      t.string :avatar

      t.timestamps
    end
  end
end
