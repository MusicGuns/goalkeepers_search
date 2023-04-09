class AddParamsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cost, :integer
    add_column :users, :level, :string
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
