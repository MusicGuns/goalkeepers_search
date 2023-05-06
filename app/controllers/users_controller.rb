class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy update_to_admin]
  before_action :user_params, only: %i[update]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def show
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

  def destroy
    authorize @user

    @user.destroy

    redirect_to root_path, notice: 'Вратарь успешно удален'
  end

    def update_to_admin
      authorize @user

      if @user.update(is_admin: true)
        flash.now[:notice] = "Теперь этот пользователь админ"
      else
        flash.now[:alert] = "Авторизация не удалась"
      end

      redirect_to user_path(@user)
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
