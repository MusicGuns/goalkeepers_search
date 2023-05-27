class AddUsersTimetableUnits < ActiveRecord::Migration[7.0]
  def change
    create_table(:timetable_units) do |t|
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.string :weekday, null: false
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true
    end
  end
end
