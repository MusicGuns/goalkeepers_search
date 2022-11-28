class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def current_user
    current_goalkeeper
  end

  def redirect_to_authenticate_goalkeeper!
    return if current_goalkeeper

    flash[:alert] = 'Для этого действия вам необходимо авторизоваться и зарегистрироваться'
    redirect_to new_goalkeeper_session_path
  end
end
