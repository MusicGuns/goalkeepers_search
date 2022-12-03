class Subscription < ApplicationRecord
  belongs_to :goalkeeper
  belongs_to :ice_palace

  validates :goalkeeper, uniqueness: { scope: :ice_palace_id }
end
