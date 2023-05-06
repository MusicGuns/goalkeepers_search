class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :ice_palace, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :weekday
      t.time :start_time
      t.time :end_time
      t.text :section_type
      t.text :level
      t.text :goalkeeper_level
      t.text :description

      t.timestamps
    end
  end
end
