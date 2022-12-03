class ChangeAvatarToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :goalkeepers, :avatar, :attachment
  end
end
