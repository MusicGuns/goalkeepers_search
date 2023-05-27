class Section < ApplicationRecord
  belongs_to :ice_palace
  belongs_to :user
  has_many :subscriptions, as: :entity, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user

  validates :weekday, presence: true, inclusion: { in: ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"] }
  validates :section_type, presence: true, inclusion: { in: ["Тренировка", "Двухсторонка", "Игра"] }
  validates :level, presence: true, inclusion: { in: ["Начинающие", "Любители",  "Cмешанные", "Мастера"] }
  validates :goalkeeper_level, presence: true, inclusion: { in: ["Новичок", "Любитель", "Любитель профи", "Спорт. школа", "Спорт. школа профи", "Мастер"] }
  validates :description, length: { maximum: 100, too_long: 'количество символов превышено' }
  validates :cost, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_time_earlier_end_time, unless: :time_nil?

  def time_nil?
    start_time.nil? || end_time.nil?
  end

  def start_time_earlier_end_time
    errors.add(:start_time, "Начало тренировки позже чем его конец") if end_time - start_time < 0
  end

  def author
    user
  end
end
