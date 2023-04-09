class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :ice_palace

  validates :user, uniqueness: { scope: :ice_palace_id }
end
