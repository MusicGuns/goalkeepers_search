class AddDescriptionToIcePalace < ActiveRecord::Migration[7.0]
  def change
    add_column :ice_palaces, :description, :string
  end
end
