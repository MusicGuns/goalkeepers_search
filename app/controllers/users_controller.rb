require 'ostruct'

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update update_to_admin schedule]
  before_action :user_params, only: %i[update]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def show
    @rating = Rating.new
  end

  def schedule
    approved_sections =
      Section
        .joins(:subscribers)
        .joins(:subscriptions)
        .where(subscribers: { id: @user })
        .where(subscriptions: { approved: true })
        .to_a

    timetable_units =
      TimetableUnit
        .where(user: @user)
        .to_a

    weekdays = %w[
      Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье
    ]

    @timetable_units = weekdays.index_with do |weekday|
      sections =
        approved_sections
          .select { |s| s.weekday == weekday }
          .map! do |s|
            OpenStruct.new(
              title: s.section_type,
              start: s.start_time.to_fs(:time),
              end: s.end_time.to_fs(:time),
              section: s,
              unit: nil
            )
          end

      units =
        timetable_units
          .select { |u| u.weekday == weekday }
          .map! do |u|
            OpenStruct.new(
              title: u.title,
              start: u.start_time.to_fs(:time),
              end: u.end_time.to_fs(:time),
              section: nil,
              unit: u
            )
          end

      sections | units
    end
  end

  def index
    permitted = params.permit(
      :cost_from, :cost_to, :metro, :level, :name, :commit
    )

    @users =
      User.where(is_goalkeeper: true)

    @users = @users.where(level: permitted[:level]) if permitted[:level].present?

    @users = @users.where('metro LIKE ?', "%#{permitted[:metro]}%") if permitted[:metro].present?
    @users = @users.where('full_name LIKE ?', "%#{permitted[:name]}%") if permitted[:name].present?

    @users = @users.where('cost >= ?', permitted[:cost_from]) if permitted[:cost_from].present?
    @users = @users.where('cost <= ?', permitted[:cost_to]) if permitted[:cost_to].present?
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to user_url(@user), notice: 'Изменение успешно добавлены'
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Регистрация прошла успешно"
    else
      render "users/new"
    end
  end

  def new
    @user = User.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :email, :full_name, :phone_number, :date_of_birth, :clubs, :metro, :avatar, :cost, :level, :is_goalkeeper, :password_confirmation)
  end

  def authorization_failed
    flash[:alert] = 'Авторизация не удалась'
    redirect_back(fallback_location: new_session_path)
  end
end
