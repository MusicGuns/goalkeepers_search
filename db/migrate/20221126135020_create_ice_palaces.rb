class CreateIcePalaces < ActiveRecord::Migration[7.0]
  def change
    create_table :ice_palaces do |t|
      t.string :title
      t.string :adress

      t.timestamps
    end
  end
end
