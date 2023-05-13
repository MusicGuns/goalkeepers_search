class Advert < ApplicationRecord
  belongs_to :author, -> { where(is_goalkeeper: false) }, class_name: :User

  has_many :subscriptions, as: :entity, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  validates :title, presence: true, length: { maximum: 50, too_long: 'количество символов превышено' }
  validates :description, presence: true, length: { maximum: 500, too_long: 'количество символов превышено' }
end
