class ChangeAvatarToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :avatar, :attachment
  end
end
