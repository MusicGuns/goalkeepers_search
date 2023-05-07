class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :section

  validates :user, uniqueness: { scope: :section_id }
end
