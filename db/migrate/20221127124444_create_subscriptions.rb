class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :goalkeeper, null: false, foreign_key: true
      t.references :ice_palace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
