class AddIsArendatorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_goalkeeper, :boolean, null: false
  end
end
