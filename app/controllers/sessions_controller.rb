class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Вы успешно вошли"
    else
      flash.now[:alert] = "Неправильный Email или Пароль"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Вы успешно вышли"
  end

  def user_params
    params.require(:session).permit(:email, :password)
  end
end