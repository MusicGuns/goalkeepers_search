class CreateAdverts < ActiveRecord::Migration[7.0]
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.bigint :author_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
