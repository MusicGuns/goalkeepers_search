class IcePalace < ApplicationRecord
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
end
