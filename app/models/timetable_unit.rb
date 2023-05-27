class TimetableUnit < ApplicationRecord
  belongs_to :user

  validates(
    :title, :start_time, :end_time, :weekday,
    presence: true
  )
  validates(
    :weekday,
    inclusion: { in: ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"] }
  )

  validate :start_time_earlier_end_time, unless: :time_nil?

  def time_nil?
    start_time.nil? || end_time.nil?
  end

  def start_time_earlier_end_time
    errors.add(:start_time, "Начало тренировки позже чем его конец") if end_time - start_time < 0
  end
end
