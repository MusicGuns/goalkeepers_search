class IcePalace < ApplicationRecord
  has_many :sections, dependent: :delete_all

  validates :title, presence: true
  validates :adress, presence: true
  validates :description, presence: true, length: { maximum: 500, too_long: 'количество символов превышено' }
  validates :cords, presence: true, format: { with: /\A\d+.\d+\-\d+.\d+\z/ }
  validates :photo, presence: true

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_fill: [300, 300]
  end
end
