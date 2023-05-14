class Rating < ApplicationRecord
  belongs_to :user

  validates :mark, inclusion: 1..5
  validates :user, uniqueness: { scope: [:author_id] }
end
