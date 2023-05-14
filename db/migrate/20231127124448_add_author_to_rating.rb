class AddAuthorToRating < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :author_id, :bigint, null: false
    add_foreign_key :ratings, :users, column: :author_id
  end
end
