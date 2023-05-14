class User < ApplicationRecord
  has_secure_password
  has_many :subscriptions, dependent: :destroy
  has_many :sections
  has_many :adverts, foreign_key: :author_id, dependent: :destroy
  has_many :ratings, foreign_key: :author_id

  validates :full_name, presence: true, format: { with: /\A([А-ЯЁ][а-яё]+[\-\s]?){3,}\z/ }

  validates :phone_number, presence: true, uniqueness: true,
                           format: { with: /\A((\+7|7|8)+([0-9]){10})\z/, message: 'Не правильный номер' }

  validates :email, presence: true, uniqueness: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
  
  validates :avatar, content_type: [:png, :jpg, :jpeg]

  with_options if: :is_goalkeeper? do |goalkeeper|
    goalkeeper.validates :level, presence: true, inclusion: { in: ["Новичок", "Любитель", "Любитель профи", "Спрот. школа", "Спорт. школа профи", "Мастер"] }
    goalkeeper.validates :metro, presence: true
    goalkeeper.validates :clubs, length: { maximum: 30, too_long: 'количество символов превышено' }
    goalkeeper.validates :cost, presence: true, numericality: { only_integer: true, greater_than: 0 }
    goalkeeper.validate :age_over, on: :update
  end

  with_options unless: :is_goalkeeper? do |arendator|
    arendator.validates :level, absence: true
    arendator.validates :metro, absence: true
    arendator.validates :clubs, absence: true
    arendator.validates :cost, absence: true
    arendator.validates :date_of_birth, absence: true
  end


  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [150, 150]
  end

  def age_over
    errors.add(:age, "ваш возраст должен быть больше 16 лет") if Date.today.year - date_of_birth.year < 16
  end

  def rating
    Rating.where(user: self).select("AVG(mark) as avg").to_a.first.avg.to_i
  end
end