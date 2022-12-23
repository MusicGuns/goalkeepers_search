class AddParamsToGoalkeepers < ActiveRecord::Migration[7.0]
  def change
    add_column :goalkeepers, :cost, :integer
    add_column :goalkeepers, :level, :string
  end
end
