class AddToIcePalaceMapScript < ActiveRecord::Migration[7.0]
  def change
    add_column :ice_palaces, :map_script, :string
  end
end
