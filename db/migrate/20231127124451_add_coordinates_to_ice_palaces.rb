class AddCoordinatesToIcePalaces < ActiveRecord::Migration[7.0]
  def change
    rename_column :ice_palaces, :map_script, :cords
  end
end
