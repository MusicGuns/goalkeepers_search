class Goalkeeper < ApplicationRecord
  has_many :subscription, dependent: :destroy
  has_many :palaces, through: :subscription, source: :ice_palace
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, format: { with: /\A([А-ЯЁ][а-яё]+[\-\s]?){3,}\z/ }

  validates :phone_number, presence: true, uniqueness: true,
                           format: { with: /\A((\+7|7|8)+([0-9]){10})\z/, message: 'Не правильный номер' }

  validates :email, uniqueness: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
  validates :clubs, length: { maximum: 30, too_long: 'количество символом превышено' }

  validates :metro, presence: true

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [150, 150]
  end

  # validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  validates :cost, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validates :level, presence: true
end
