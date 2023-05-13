class Subscription < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :user

  validates :user, uniqueness: { scope: [:entity_id, :entity_type] }
end
